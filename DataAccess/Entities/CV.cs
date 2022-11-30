namespace CViewer.DataAccess.Entities
{
    public enum CVTag
    {
        DotNet,
        Java,
        Flatter,
        SQL,
    }

    public enum Specialization
    {
        SoftwareEngineer,
        DataAnalyst,
    }

    public class CV
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int PeopleCreatedId { get; set; }
        public Specialization Specialization { get; set; }
        public string Description { get; set; }
        public double Rating { get; set; }
        public List<CVTag> Tags { get; set; }
        public DateTime DateCreation { get; set; }
    }
}