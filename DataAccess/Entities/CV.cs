using System.ComponentModel.DataAnnotations;
using CViewer.DataAccess.Repositories;

namespace CViewer.DataAccess.Entities
{
    public partial class CV
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

        public virtual ICollection<Profile> CvExperts { get; set; } = new List<Profile>();

        public virtual ICollection<CVHistory> CvHistories { get; set; } = new List<CVHistory>();

        public virtual ICollection<Tag> CvTags { get; set;  } = new List<Tag>();

        public virtual Profile PeopleCreated { get; set; }

        public virtual Specialization Specialization { get; set; }

        public virtual Status Status { get; set; }
    }
}