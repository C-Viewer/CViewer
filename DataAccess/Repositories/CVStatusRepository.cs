using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.Repositories
{
    public enum CVStatusType
    {
        Draft,
        SentToReview,
        TakenToReview,
        NeedFix,
        Reviewed,
        Finished,
    }

    internal sealed class CVStatusRepository
    {
        internal static List<CVStatusType> CvStatuses = ((CVStatusType[])Enum.GetValues(typeof(CVStatusType))).ToList();
        public static List<Status> Statuses = new()
        {
            new() { Name = CVStatusType.Draft },
            new() { Name = CVStatusType.SentToReview },
            new() { Name = CVStatusType.TakenToReview },
            new() { Name = CVStatusType.NeedFix },
            new() { Name = CVStatusType.Reviewed },
            new() { Name = CVStatusType.Finished }
        };
    }
}
