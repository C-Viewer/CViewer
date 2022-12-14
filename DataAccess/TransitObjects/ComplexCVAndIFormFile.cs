using System.Reflection;
using CViewer.DataAccess.InnerEntities;
using Newtonsoft.Json;
using Serilog;
using Serilog.Events;

namespace CViewer.DataAccess.TransitObjects
{
    public class ComplexCVAndIFormFile
    {
        public CVDraftParameter CvDraft { get; set; }

        public IFormFile File { get; set; }

        public static async ValueTask<ComplexCVAndIFormFile?> BindAsync(HttpContext context,
            ParameterInfo parameter)
        {
            var logger = new LoggerConfiguration()
                .WriteTo.Console()
                .CreateLogger();

            IFormCollection form = await context.Request.ReadFormAsync();
            string serializedCv = form[nameof(CvDraft)];

            logger.Write(LogEventLevel.Information, $"{nameof(serializedCv)}: {serializedCv}");

            CVDraftParameter cvDraft = JsonConvert.DeserializeObject<CVDraftParameter>(serializedCv);
            IFormFile file = form.Files[nameof(File)];

            if (file != null)
            {
                using (Stream stream = file.OpenReadStream())
                {
                    int byteValue;
                    int step = 0;
                    while ((byteValue = stream.ReadByte()) != -1 && step < 10)
                    {
                        logger.Write(LogEventLevel.Information, byteValue.ToString());
                        step++;
                    }
                    Console.WriteLine();
                }
            }

            return new ComplexCVAndIFormFile
            {
                File = file,
                CvDraft = cvDraft,
            };
        }
    }
}
