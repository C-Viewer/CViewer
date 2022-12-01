using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    public class CVRepository
    {
        public static List<CV> CVs = new()
        {
            new() { 
                Id = 1, 
                Title = "My fantasies", 
                Description = "Very dark and nice.", 
                Rating = 6.8,
                DateCreation = new DateTime(2022, 12, 1, 16, 13, 33),
                PeopleCreatedId = 2,
                Specialization = Specialization.DataAnalyst,
                Tags = new List<CVTag>() { CVTag.SQL, CVTag.DotNet },
            },
        };
    }
}