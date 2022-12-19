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
                Name = "Flutter",
            },
            new CVTag()
            {
                Id = 4,
                Name = "SQL",
            },
            new CVTag()
            {
                Id = 5,
                Name = "Python",
            },
            new CVTag()
            {
                Id = 6,
                Name = "Figma",
            },
            new CVTag()
            {
                Id = 7,
                Name = "C++",
            },
            new CVTag()
            {
                Id = 8,
                Name = "Android Studio",
            },
            new CVTag()
            {
                Id = 9,
                Name = "Jira Atlassian",
            },
            new CVTag()
            {
                Id = 10,
                Name = "Git",
            },
            new CVTag()
            {
                Id = 11,
                Name = "Docker",
            },
            new CVTag()
            {
                Id = 12,
                Name = "Linux",
            },
            new CVTag()
            {
                Id = 13,
                Name = "Swagger UI",
            },
            new CVTag()
            {
                Id = 14,
                Name = "Postman",
            },
            new CVTag()
            {
                Id = 15,
                Name = "Angular",
            },
        };

        public static HashSet<int> CVTagIds = CVTags.Select(tag => tag.Id).ToHashSet();
    }
}
