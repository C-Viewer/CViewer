namespace CViewer.Services
{
    public interface IAmazonS3Service
    {
        public Task<List<string>> GetFileNamesAsync();
        public Task<bool> AddFileAsync(IFormFile stream, string path);
        public Task<string> GetFileAsync(string path);
        public Task<bool> DeleteFileAsync(string path);
    }
}
