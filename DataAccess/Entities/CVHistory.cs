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
        public int? AttachedFileId { get; set; }

        [Required]
        public int CVId { get; set; }

        /// <summary>
        /// If null, then event is created by applicant
        /// </summary>
        public int? ExpertId { get; set; }
        public string AmazonPathToFile { get; set; }
        public string Comment { get; set; }
        public double? Grade { get; set; }

        [Required]
        public DateTime DateTime { get; set; }
    }
}
