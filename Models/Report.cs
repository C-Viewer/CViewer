namespace MinimalJwt.Models
{
    public enum ReportStatus
    {
        Comment,
        Feedback,
    }

    public class Report
    {
        public int Id { get; set; }
        public ReportStatus Status { get; set; }
        public string Text { get; set; }
        public int PeopleId { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
