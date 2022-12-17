using CViewer.DataAccess.Entities;
using CViewer.DataAccess.InnerEntities;
using CViewer.DataAccess.Repositories;
using static CViewer.DataAccess.EntitiesHelper;

namespace CViewer.Services
{
    public interface ICVService
    {
        public CV CreateCVForReview(CVDraftParameter cvDraft, Profile applicant);

        /// <returns>URL for download</returns>
        public Task<string> StoreFileAsync(IFormFile file, IAmazonS3Service service);
        public void PinToHistory(string fileName, string urlForDownload, int cvId, int authorId);
        public CV UpdateCVInfo(int cvId, string title = null, Specialization specialization = null, List<CVTag> tags = null, string description = null);
        public CVHistory CreateCVEventForHistory(CVHistoryParameter cvHistoryParameter, out string errMsg);
        public List<CVHistory> ListCVHistories();
        public List<CVHistory> ListCVHistories(int cvId);
        public List<AttachedFile> ListAttachedFiles();
        public List<CV> ListCVs();
        public List<CV> ListCVsForProfile(string applicantOrExpertToken);
        public CVStatusType GetCVStatus(int cvId);
        public CV GetCV(int id);
        public CVHistory GetCVHistory(int id);
        public AttachedFile GetAttachedFile(int id);
        public List<CVTag> ListCVTags();
        public List<CVStatusTypeObject> ListCVStatuses();
        public List<Specialization> ListSpecializations();
        //public bool Delete(int id);
        List<CV> ListCvsOpenedForReview();
        bool TakeCvToReview(int cvId, int expertId, out string errorMessage);
        void MakeCvAsGood(int cvId);
        List<CV> ListGoodCvs();
        void UpdateCvStatusIfNecessary(CVHistory cvEventForHistory);
        void PinFileToCv(int cvId, string fileName, string urlToStoreFile);
        void FinishCvReview(CV cv);
        public CviewerReport GenerateCViewerReport(DateTime date);
    }
}
