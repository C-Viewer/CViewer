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

            logger.Write(LogEventLevel.Information, $"BindAsync {nameof(ComplexCVAndIFormFile)}: {nameof(serializedCv)}: {serializedCv}\n");

            CVDraftParameter cvDraft = JsonConvert.DeserializeObject<CVDraftParameter>(serializedCv);

            logger.Write(LogEventLevel.Information, $"BindAsync {nameof(ComplexCVAndIFormFile)}: {nameof(cvDraft)} is null?: {cvDraft == null}\n");

            logger.Write(LogEventLevel.Information,
                $"BindAsync {nameof(ComplexCVAndIFormFile)}: {nameof(cvDraft.Title)}: {cvDraft.Title}\n{nameof(cvDraft.FileName)}: {cvDraft.FileName}\nCount of {nameof(cvDraft.Tags)}: {cvDraft.Tags.Count}\n");

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
