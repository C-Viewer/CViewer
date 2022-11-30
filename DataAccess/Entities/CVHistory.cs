namespace CViewer.DataAccess.Entities
{
    public class CVHistory
    {
        public int Id { get; set; }
        public int CVId { get; set; }
        public string PathToFile { get; set; }
        public string ApplicantComment { get; set; }
        public string ExpertComment { get; set; }
        public double Grade { get; set; }
        public DateTime DateTime { get; set; }
    }
}
