using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using System;
using System.Collections.Generic;
using System.IO;

namespace CViewer
{
    internal class AmazonS3
    {
        private readonly string bucketName = "cviewercvs";
        private readonly string accessKey = "AKIASC4V2PC2PAIBTQWN";
        private readonly string secretKey = "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";
        private readonly AmazonS3Config amazonS3Config = new AmazonS3Config();

        public AmazonS3()
        {
            amazonS3Config.RegionEndpoint = RegionEndpoint.GetBySystemName("eu-north-1");
            amazonS3Config.SignatureVersion = "4";
            amazonS3Config.SignatureMethod = Amazon.Runtime.SigningAlgorithm.HmacSHA256;
        }

        public List<string> GetFiles()
        {
            using (var client = AWSClientFactory.CreateAmazonS3Client(accessKey, secretKey, amazonS3Config))
            {
                var list = client.ListObjects(
                    new ListObjectsRequest()
                    {
                        BucketName = bucketName
                    });

                List<string> files = new List<string>();

                foreach (var file in list.S3Objects)
                {
                    files.Add(file.Key);
                }
                return files;
            }
        }

        public void AddFile(FileStream stream, string path)
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
            }
        }

        public Stream GetFile(string path)
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

        public void DeleteFile(string path)
        {
            using (var client = AWSClientFactory.CreateAmazonS3Client(accessKey, secretKey, amazonS3Config))
            {
                var request = new DeleteObjectRequest
                {
                    BucketName = bucketName,
                    Key = path
                };

                client.DeleteObject(request);
            }
        }
    }
}
