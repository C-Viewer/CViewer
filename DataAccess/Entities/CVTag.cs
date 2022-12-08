using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public class CVTag
    {

        [Required]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
    }
}
