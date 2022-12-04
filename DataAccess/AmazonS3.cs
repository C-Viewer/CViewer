using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using System;
using System.Collections.Generic;
using System.IO;

namespace CViewer
{
    sealed internal class AmazonS3
    {
        private readonly string bucketName = "cviewercvs";
        private readonly string accessKey;
        private readonly string secretKey;
        private readonly AmazonS3Config amazonS3Config = new AmazonS3Config();

        public AmazonS3(string access, string secret)
        {
            accessKey = access;
            secretKey = secret;
            amazonS3Config.RegionEndpoint = RegionEndpoint.GetBySystemName("eu-north-1");
            amazonS3Config.SignatureVersion = "4";
            amazonS3Config.SignatureMethod = Amazon.Runtime.SigningAlgorithm.HmacSHA256;
        }

        public List<string> GetFiles()
        {
            try
            {
                using (var client = AWSClientFactory.CreateAmazonS3Client(accessKey, secretKey, amazonS3Config))
                {
                    var list = client.ListObjects(
                        new ListObjectsRequest()
                        {
                            BucketName = bucketName
                        });

                    List<string> fileNames = new List<string>();

                    foreach (var fileName in list.S3Objects)
                    {
                        fileNames.Add(fileName.Key);
                    }
                    return fileNames;
                }
            }
            catch
            {
                return null;
            }
        }

        public bool AddFile(FileStream stream, string path)
        {
            try
            {
                using (var client = AWSClientFactory.CreateAmazonS3Client(accessKey, secretKey, amazonS3Config))
                {
                    var request = new PutObjectRequest
                    {
                        BucketName = bucketName,
                        CannedACL = S3CannedACL.PublicRead,
                        Key = path,
                        InputStream = stream
                    };

                    client.PutObject(request);
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public Stream GetFile(string path)
        {
            try
            {
                using (var client = AWSClientFactory.CreateAmazonS3Client(accessKey, secretKey, amazonS3Config))
                {
                    var request = new GetObjectRequest
                    {
                        BucketName = bucketName,
                        Key = path
                    };

                    GetObjectResponse myResponse = client.GetObject(request);
                    Stream myStream = myResponse.ResponseStream;
                    return myStream;
                }
            }
            catch
            {
                return null;
            }
        }

        public bool DeleteFile(string path)
        {
            try
            {
                using (var client = AWSClientFactory.CreateAmazonS3Client(accessKey, secretKey, amazonS3Config))
                {
                    var request = new DeleteObjectRequest
                    {
                        BucketName = bucketName,
                        Key = path
                    };

                    client.DeleteObject(request);
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
