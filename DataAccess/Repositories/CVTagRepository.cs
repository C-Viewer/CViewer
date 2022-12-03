using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class CVTagRepository
    {
        public static List<CVTag> CVTags = new()
        {
            new CVTag()
            {
                Id = 1,
                Name = "DotNet",
            },
            new CVTag()
            {
                Id = 2,
                Name = "Java",
            },
            new CVTag()
            {
                Id = 3,
                Name = "Flatter",
            },
            new CVTag()
            {
                Id = 4,
                Name = "SQL",
            },
        };
    }
}