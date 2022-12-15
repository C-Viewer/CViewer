using System.ComponentModel.DataAnnotations;
using CViewer.DataAccess.Repositories;

namespace CViewer.DataAccess.Entities
{
    public class CV
    {

        [Required]
        public int Id { get; set; }

        [Required]
        public CVStatusType StatusId { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public int PeopleCreatedId { get; set; }
        public List<int> ExpertIds { get; set; }
        public Specialization Specialization { get; set; }
        public string Description { get; set; }
        public double Rating { get; set; }
        public List<CVTag> Tags { get; set; }
        
        [Required]
        public DateTime DateCreation { get; set; }
        public bool GoodCv { get; set; }

        public bool OpenToReview { get; set; }
    }
}