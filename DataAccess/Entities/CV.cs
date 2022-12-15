using System.ComponentModel.DataAnnotations;
using CViewer.DataAccess.Repositories;

namespace CViewer.DataAccess.Entities
{
    public class CV
    {
        // ToDo: Made All Ids as readonly
        public CV(int cvId)
        {
            Id = cvId;
        }

        [Required]
        public int Id { get; }

        [Required]
        public CVStatusType StatusId { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public int PeopleCreatedId { get; set; }
        public List<int> ExpertIds { get; set; }
        public Specialization Specialization { get; set; }
        public string Description { get; set; }
        public double? Rating { get; set; }
        public List<CVTag> Tags { get; set; }
        
        [Required]
        public DateTime DateCreation { get; set; }
        public bool GoodCv { get; set; }

        public bool OpenToReview { get; set; }

        public string UrlFileForDownload { get; set; }
        public string PinnedFileName { get; set; }
        public double? Grade { get; set; }
    }
}