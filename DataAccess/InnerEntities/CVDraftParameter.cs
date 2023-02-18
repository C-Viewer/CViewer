using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.InnerEntities
{
    public class CVDraftParameter
    {
        [Required]
        public string Title { get; set; }

        public List<string> Tags { get; set; }
        public string FileName { get; set; }
        public string Description { get; set; }
    }
}
