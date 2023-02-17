namespace CViewer.Utils
{
    internal static class WorkWithFiles
    {
        public static Stream GenerateStreamFromString(string s)
        {
            var stream = new MemoryStream();
            var writer = new StreamWriter(stream);
            writer.Write(s);
            writer.Flush();
            stream.Position = 0;
            return stream;
        }

        public static IFormFile ReturnFormFile(Stream result, string path)
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

        public static string GetDateForName()
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
