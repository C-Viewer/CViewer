namespace CViewer.DataAccess.Repositories
{
    public enum CVStatusType
    {
        Draft,
        SentToReview,
        TakenToReview,
        CommentedGradedNeedFix,
        
        // Applicant, perhaps, want to discuss with reviewer yet.
        MaxGrade,

        // Grade may be less then max of available grade (in case when applicant close review yourself).
        // Close only by applicant.
        FinishedWithGrade,

        // Applicant added info about company with interview.
        FinishWithCompany,

        PublishedInGoodStore
    }

    internal sealed class CVStatusRepository
    {
        internal static List<CVStatusType> CvStatuses = ((CVStatusType[])Enum.GetValues(typeof(CVStatusType))).ToList();
    }
}
