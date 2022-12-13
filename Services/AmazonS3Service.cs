using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using Newtonsoft.Json;

namespace CViewer.Services
{
    internal sealed class AmazonS3Service : IAmazonS3Service
    {
        private readonly string _bucketName = "cviewercvs";
        private readonly string _accessKey;
        private readonly string _secretKey;
        private readonly AmazonS3Config _amazonS3Config = new();
        private readonly string _amazonRegionEndpoint = "eu-north-1";

        public AmazonS3Service(string access, string secret)
        {
            _accessKey = access;
            _secretKey = secret;
            _amazonS3Config.RegionEndpoint = RegionEndpoint.GetBySystemName(_amazonRegionEndpoint);
        }

        public async Task<List<string>> GetFileNamesAsync()
        {
            try
            {
                using (IAmazonS3 client = new AmazonS3Client(_accessKey, _secretKey, _amazonS3Config))
                {
                    ListObjectsV2Response listAmazonFiles = await client.ListObjectsV2Async(
                        new ListObjectsV2Request()
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
            catch
            {
                return null;
            }
        }

        public async Task<bool> AddFileAsync(IFormFile stream, string path)
        {
            try
            {
                using (IAmazonS3 client = new AmazonS3Client(_accessKey, _secretKey, _amazonS3Config))
                {
                    PutObjectRequest request = new PutObjectRequest
                    {
                        BucketName = _bucketName,
                        CannedACL = S3CannedACL.PublicRead,
                        Key = path,
                        InputStream = stream.OpenReadStream()
                    };

                    await client.PutObjectAsync(request);
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }

        public async Task<string> GetFileAsync(string path)
        {
            try
            {
                using (IAmazonS3 client = new AmazonS3Client(_accessKey, _secretKey, _amazonS3Config))
                {
                    GetObjectRequest request = new GetObjectRequest
                    {
                        BucketName = _bucketName,
                        Key = path
                    };

                    GetObjectResponse myResponse = await client.GetObjectAsync(request);
                    Stream myStream = myResponse.ResponseStream;

                    MemoryStream memStream = new();
                    myStream.CopyTo(memStream);
                    memStream.Seek(0, SeekOrigin.Begin);

                    var json = JsonConvert.SerializeObject(memStream, Formatting.Indented, new MemoryStreamJsonConverter());
                    return json;
                }
            }
            catch
            {
                return null;
            }
        }

        public async Task<bool> DeleteFileAsync(string path)
        {
            try
            {
                using (IAmazonS3 client = new AmazonS3Client(_accessKey, _secretKey, _amazonS3Config))
                {
                    DeleteObjectRequest request = new DeleteObjectRequest
                    {
                        BucketName = _bucketName,
                        Key = path
                    };

                    await client.DeleteObjectAsync(request);
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
