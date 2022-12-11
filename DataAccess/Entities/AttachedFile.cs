using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public class AttachedFile
    {

        [Required]
        public int Id { get; set; }

        [Required]
        public string FileName { get; set; }

        [Required]
        public string FilePath { get; set; }
    }
}
