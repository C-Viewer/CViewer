using Amazon;
using Amazon.S3;
using Amazon.S3.Model;

namespace CViewer.Services
{
    internal sealed class AmazonS3Service : IAmazonS3Service
    {
        private readonly string _bucketName = "cviewercvs";
        private readonly string _accessKey = "AKIASC4V2PC2FUWPA4MS";
        private readonly string _secretKey = "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";
        private readonly AmazonS3Config _amazonS3Config = new();
        private readonly string _amazonRegionEndpoint = "eu-north-1";
        private readonly string _amazonSignatureVersion = "4";

        public AmazonS3Service()
        {
            _accessKey = "AKIASC4V2PC2FUWPA4MS";
            _secretKey = "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";
            _amazonS3Config.RegionEndpoint = RegionEndpoint.GetBySystemName(_amazonRegionEndpoint);
            _amazonS3Config.SignatureVersion = _amazonSignatureVersion;
            _amazonS3Config.SignatureMethod = Amazon.Runtime.SigningAlgorithm.HmacSHA256;
        }

        public List<string> GetFileNames()
        {
            try
            {
                using (IAmazonS3 client = AWSClientFactory.CreateAmazonS3Client(_accessKey, _secretKey, _amazonS3Config))
                {
                    ListObjectsResponse listAmazonFiles = client.ListObjects(
                        new ListObjectsRequest()
                        {
                            BucketName = _bucketName
                        });

                    List<string> fileNames = new();

                    foreach (S3Object fileName in listAmazonFiles.S3Objects)
                    {
                        fileNames.Add(fileName.Key);
                    }
                    return fileNames;
                }
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public bool AddFile(FileStream stream, string path)
        {
            try
            {
                using (IAmazonS3 client = AWSClientFactory.CreateAmazonS3Client(_accessKey, _secretKey, _amazonS3Config))
                {
                    PutObjectRequest request = new PutObjectRequest
                    {
                        BucketName = _bucketName,
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
                using (IAmazonS3 client = AWSClientFactory.CreateAmazonS3Client(_accessKey, _secretKey, _amazonS3Config))
                {
                    GetObjectRequest request = new GetObjectRequest
                    {
                        BucketName = _bucketName,
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
                using (IAmazonS3 client = AWSClientFactory.CreateAmazonS3Client(_accessKey, _secretKey, _amazonS3Config))
                {
                    DeleteObjectRequest request = new DeleteObjectRequest
                    {
                        BucketName = _bucketName,
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
