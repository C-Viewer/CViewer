namespace CViewer.DataAccess.Entities
{
    public class CV
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int PeopleCreatedId { get; set; }
        public List<int> ExpertIds { get; set; }
        public Specialization Specialization { get; set; }
        public string Description { get; set; }
        public double Rating { get; set; }
        public List<CVTag> Tags { get; set; }
        public DateTime DateCreation { get; set; }
    }
}