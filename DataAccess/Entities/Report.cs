using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public enum ReportStatus
    {
        Comment,
        Feedback,
    }

    public class Report
    {
        [Required]
        public int Id { get; set; }
        public int PeopleId { get; set; }
        public int AuthorId { get; set; }
        public int Rating { get; set; }
        public DateTime CreatedDate { get; set; }

        public string Text { get; set; }
        public ReportStatus Status { get; set; }
    }
}
