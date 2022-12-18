using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class CVTagRepository
    {
        public static List<Tag> CVTags = new()
        {
            new Tag()
            {
                Id = 1,
                Name = "DotNet",
            },
            new Tag()
            {
                Id = 2,
                Name = "Java",
            },
            new Tag()
            {
                Id = 3,
                Name = "Flutter",
            },
            new Tag()
            {
                Id = 4,
                Name = "SQL",
            },
            new Tag()
            {
                Id = 5,
                Name = "Python",
            },
        };

        public static HashSet<int> CVTagIds = CVTags.Select(tag => tag.Id).ToHashSet();
    }
}