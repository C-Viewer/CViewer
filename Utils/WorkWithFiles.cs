namespace CViewer.Utils
{
    public class WorkWithFiles
    {
        public Stream GenerateStreamFromString(string s)
        {
            var stream = new MemoryStream();
            var writer = new StreamWriter(stream);
            writer.Write(s);
            writer.Flush();
            stream.Position = 0;
            return stream;
        }

        public IFormFile ReturnFormFile(Stream result, string path)
        {
            var ms = new MemoryStream();
            try
            {
                result.CopyTo(ms);
                return new FormFile(ms, 0, ms.Length, "stream", path);
            }
            catch
            {
                ms.Dispose();
                throw;
            }
        }

        public string GetDateForName()
        {
            string dateNow = LocalTimeHelper.GetMoscowDateTime(DateTime.UtcNow).ToString();
            var charsToRemove = new string[] { ".", ":", "/" };
            foreach (var c in charsToRemove)
            {
                dateNow = dateNow.Replace(c, string.Empty);
            }
            return dateNow;
        }
    }
}
