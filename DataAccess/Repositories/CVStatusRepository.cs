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
    }
}
