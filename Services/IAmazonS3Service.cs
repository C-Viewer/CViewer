namespace CViewer.Services
{
    public interface IAmazonS3Service
    {
        public List<string> GetFileNames();
        public bool AddFile(IFormFile stream, string path);
        public MemoryStream GetFile(string path);
        public bool DeleteFile(string path);
    }
}
