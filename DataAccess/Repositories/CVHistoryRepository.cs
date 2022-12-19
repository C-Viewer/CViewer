using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    internal sealed class CVHistoryRepository
    {
        public static List<CvHistory> CVHistories = new()
        {
            new()
            {
                Id = 1,
                CvId = 1,
                Comment = "Вам следует исправить информацию о реализацованных проектах, а также опыт работы.",
                DateTime = new DateTime(2022, 12, 1, 17, 13, 33),
                Grade = 3,
                AuthorId = 1,
            },

            new()
            {
                Id = 2,
                CvId = 1,
                Comment = "Что Вас не устроило в описании проектов?",
                DateTime = new DateTime(2022, 12, 1, 17, 12, 00),
                AuthorId = 2,
            },

            new()
            {
                Id = 3,
                CvId = 2,
                Comment = "Отличное Cv в плане навыков и истории. Более того, визуальный стиль позволяет легко читать Ваше резюме.",
                DateTime = new DateTime(2022, 12, 12, 11, 12, 00),
                Grade = 5,
                AuthorId = 4,
            },
        };
    }
}