using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class CVHistoryRepository
    {
        public static List<CVHistory> CVHistories = new()
        {
            new()
            {
                Id = 1,
                CVId = 1,
                Comment = "You choose the wrong door",
                DateTime = new DateTime(2022, 12, 1, 17, 13, 33),
                Grade = 9.8
            },

            new()
            {
                Id = 2,
                CVId = 1,
                Comment = "Sorry for what?!",
                DateTime = new DateTime(2022, 12, 1, 17, 12, 00),
            },
        };
    }
}