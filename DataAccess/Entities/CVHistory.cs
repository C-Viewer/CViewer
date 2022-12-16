using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    /// <summary>
    /// I assume, UI could be able retrieve main CV info from CV table not CVHistory table
    /// </summary>
    public class CVHistory
    {
        [Required]
        public int Id { get; set; }

        [Required]
        public int CVId { get; set; }

        [Required]
        public DateTime DateTime { get; set; }
      
        public int AuthorId { get; set; }
        public string FileName { get; set; }
        public string AmazonPathToFile { get; set; }
        public string Comment { get; set; }
        public int? Grade { get; set; }
    }
}
