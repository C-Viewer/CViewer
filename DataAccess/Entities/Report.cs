namespace CViewer.DataAccess.Entities
{
    public enum ReportStatus
    {
        Comment,
        Feedback,
    }

    public class Report
    {
        public int Id { get; set; }
        public string? Text { get; set; }
        public int PeopleId { get; set; }
        public int AuthorId { get; set; }
        public int Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
