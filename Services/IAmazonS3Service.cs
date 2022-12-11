namespace CViewer.Services
{
    public interface IAmazonS3Service
    {
        public List<string> GetFileNames();
        public bool AddFile(FileStream stream, string path);
        public Stream GetFile(string path);
        public bool DeleteFile(string path);
    }
}
