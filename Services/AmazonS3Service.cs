using Amazon;
using Amazon.S3;
using Amazon.S3.Model;

namespace CViewer.Services
{
    internal sealed class AmazonS3Service : IAmazonS3Service
    {
        private readonly string _bucketName = "cviewercvs";
        private readonly string _accessKey;
        private readonly string _secretKey;
        private readonly AmazonS3Config _amazonS3Config = new();
        private readonly string _amazonRegionEndpoint = "eu-north-1";
        private readonly string _amazonSignatureVersion = "4";

        public AmazonS3Service()
        {
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

        public bool AddFile(IFormFile stream, string path)
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
                        InputStream = stream.OpenReadStream()
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

        public MemoryStream GetFile(string path)
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

                    MemoryStream memStream = new();
                    myStream.CopyTo(memStream);
                    memStream.Seek(0, SeekOrigin.Begin);
                    return memStream;

                    //return myStream;
                    //return new FormFile(memStream, 0, memStream.Length, "MyOutput.txt", "MyOutput.txt");
                    //byte[] data = memStream.ToArray();
                    //return Convert.ToBase64String(data);
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
                    //DeleteObjectRequest request = new DeleteObjectRequest
                    //{
                    //    BucketName = _bucketName,
                    //    Key = path
                    //};

                    client.DeleteObject(_bucketName, path);
                    return true;
                }
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
