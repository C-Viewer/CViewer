using System.Reflection;
using CViewer.DataAccess.InnerEntities;
using Newtonsoft.Json;

namespace CViewer.DataAccess.TransitObjects
{
    public class ComplexCVAndIFormFile
    {
        public CVDraftParameter CvDraft { get; set; }

        public IFormFile File { get; set; }

        public static async ValueTask<ComplexCVAndIFormFile?> BindAsync(HttpContext context,
            ParameterInfo parameter)
        {
            IFormCollection form = await context.Request.ReadFormAsync();
            string serializedCv = form[nameof(CvDraft)];
            CVDraftParameter cvDraft = JsonConvert.DeserializeObject<CVDraftParameter>(serializedCv);
            IFormFile file = form.Files[nameof(File)];
            return new ComplexCVAndIFormFile
            {
                File = file,
                CvDraft = cvDraft,
            };
        }
    }
}
