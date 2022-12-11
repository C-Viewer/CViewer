using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.InnerEntities
{
    public class CVHistoryParameter
    {
        [Required]
        public int CVId { get; set; }

        /// <summary>
        /// If null, then event is created by applicant
        /// </summary>
        public int? ExpertId { get; set; }
        public string FileName { get; set; }
        public string AmazonPathToFile { get; set; }
        public string Comment { get; set; }
        public double? Grade { get; set; }
    }
}
