using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class ReportRepository
    {
        public static List<Report> Reports = new()
        {
            new()
            {
                Id = 1,
                AuthorId = 3,
                PeopleId = 4,
                Rating = 5,
                CreatedDate = new DateTime(2022, 12, 05, 17, 05, 01)
            },
            
            new()
            {
                Id = 2,
                AuthorId = 2,
                PeopleId = 1,
                Rating = 5,
                CreatedDate = new DateTime(2022, 12, 07, 13, 01, 01)
            },
            
            new()
            {
                Id = 3,
                AuthorId = 2,
                PeopleId = 1,
                Rating = 5,
                CreatedDate = new DateTime(2022, 12, 06, 19, 15, 01)
            },
            
            new()
            {
                Id = 4,
                AuthorId = 5,
                PeopleId = 4,
                Rating = 4,
                CreatedDate = new DateTime(2022, 12, 20, 18, 25, 01)
            }
        };
    }
}
