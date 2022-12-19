using CViewer.DataAccess.Repositories;
using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public class CVStatus
    {

        [Required]
        public int Id { get; set; }

        [Required]
        public CVStatusType Name { get; set; }
    }
}