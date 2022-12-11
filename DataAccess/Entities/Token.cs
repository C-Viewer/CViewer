using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public class Token
    {

        [Required]
        public int Id { get; set; }
        
        [Required]
        public string Value { get; set; }
        
        [Required]
        public DateTime ExpirationDateTime { get; set; }
    }
}
