using CViewer.DataAccess.InnerEntities;
using Newtonsoft.Json;
using Serilog.Events;
using Serilog;
using System.Reflection;

namespace CViewer.DataAccess.TransitObjects
{
    public class ComplexCVHistoryParameterAndFIle
    {
        public CVHistoryParameter CVHistoryParameter { get; set; }

        public IFormFile File { get; set; }

        public static async ValueTask<ComplexCVHistoryParameterAndFIle?> BindAsync(HttpContext context,
            ParameterInfo parameter)
        {
            var logger = new LoggerConfiguration()
                .WriteTo.Console()
                .CreateLogger();

            IFormCollection form = await context.Request.ReadFormAsync();
            string serializedCvHistory = form[nameof(CVHistoryParameter)];

            logger.Write(LogEventLevel.Information, $"BindAsync {nameof(ComplexCVHistoryParameterAndFIle)}: {nameof(serializedCvHistory)}: {serializedCvHistory}\n");

            CVHistoryParameter cvHist = JsonConvert.DeserializeObject<CVHistoryParameter>(serializedCvHistory);

            logger.Write(LogEventLevel.Information, $"BindAsync {nameof(ComplexCVHistoryParameterAndFIle)}: {nameof(cvHist)} is null?: {cvHist == null}\n");

            if (cvHist.FileName != null ||
                cvHist.Comment != null ||
                cvHist.Grade != null)
            {
                logger.Write(LogEventLevel.Information,
                    $"BindAsync {nameof(ComplexCVHistoryParameterAndFIle)}: \nSuccessfully deserialized! At least once is not null.");
            }

            IFormFile file = form.Files[nameof(File)];

            if (file == null)
            {
                logger.Write(LogEventLevel.Information, $"BindAsync {nameof(ComplexCVHistoryParameterAndFIle)}: file is null\n");
            }

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

            return new ComplexCVHistoryParameterAndFIle
            {
                File = file,
                CVHistoryParameter = cvHist,
            };
        }
    }
}
