using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public partial class Cv
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public int StatusId { get; set; }

        public string Description { get; set; }

        public int PeopleCreatedId { get; set; }

        public int SpecializationId { get; set; }

        public DateTime DateCreation { get; set; }

        public bool GoodCv { get; set; }

        public int? Grade { get; set; }

        public string PinnedFileName { get; set; }

        public string UrlFileForDownload { get; set; }

        public bool OpenToReview { get; set; }

        public virtual ICollection<CvExpert> CvExperts { get; } = new List<CvExpert>();

        public virtual ICollection<CvHistory> CvHistories { get; } = new List<CvHistory>();

        public virtual ICollection<CvTag> CvTags { get; } = new List<CvTag>();

        public virtual Profile PeopleCreated { get; set; }

        public virtual Specialization Specialization { get; set; }

        public virtual Status Status { get; set; }

        public List<Profile> Experts { get; set; } = new List<Profile>();

        public List<Tag> Tags { get; set; } = new List<Tag>();
    }
}
