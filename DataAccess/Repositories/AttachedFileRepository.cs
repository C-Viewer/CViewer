using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    public class AttachedFileRepository
    {
        public static List<AttachedFile> AttachedFiles = new()
        {
            new AttachedFile
            {
                Id = 1,
                FileName = "First file.txt",
                FilePath = "amazonS3/somePath/First file.txt",
            },

            new AttachedFile
            {
                Id = 2,
                FileName = "Second file.pdf",
                FilePath = "amazonS3/somePath/Second file.pdf",
            },
        };
    }
}
