using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public class ProfileToToken
    {
        [Required]
        public int ProfileId { get; set; }

        [Required]
        public Token Token { get; set; }
    }
}