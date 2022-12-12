using CViewer.DataAccess.Entities;
using CViewer.DataAccess.Repositories;
using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.InnerEntities
{
    public class CVDraftParameter
    {
        [Required]
        public string Title { get; set; }

        public string Description { get; set; }
        public List<CVTag> Tags { get; set; }
        public string FileName { get; set; }
        public IFormFile FileData { get; set; }
    }
}
