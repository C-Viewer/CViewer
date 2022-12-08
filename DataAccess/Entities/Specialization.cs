using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public class Specialization
    {
        [Required]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }
    }
}