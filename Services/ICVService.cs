using CViewer.DataAccess.Entities;
using CViewer.DataAccess.InnerEntities;
using CViewer.DataAccess.Repositories;
using static CViewer.DataAccess.EntitiesHelper;

namespace CViewer.Services
{
    public interface ICVService
    {
        public Cv CreateCVForReview(CVDraftParameter cvDraft, Profile applicant);

        /// <returns>URL for download</returns>
        public Task<string> StoreFileAsync(IFormFile file, IAmazonS3Service service);
        public void PinToHistory(string fileName, string urlForDownload, int cvId, int authorId);
        public Cv UpdateCVInfo(int cvId, string title = null, Specialization specialization = null, List<Tag> tags = null, string description = null);
        public CvHistory CreateCVEventForHistory(CVHistoryParameter cvHistoryParameter, out string errMsg);
        public List<CvHistory> ListCVHistories();
        public List<CvHistory> ListCVHistories(int cvId);
        public List<Cv> ListCVs();
        public List<Cv> ListCVsForProfile(string applicantOrExpertToken);
        public Status GetCVStatus(int cvId);
        public Cv GetCV(int id);
        public CvHistory GetCVHistory(int id);
        public List<Tag> ListCVTags();
        public List<CVStatusTypeObject> ListCVStatuses();
        public List<Specialization> ListSpecializations();
        //public bool Delete(int id);
        List<Cv> ListCvsOpenedForReview();
        bool TakeCvToReview(int cvId, int expertId, out string errorMessage);
        void MakeCvAsGood(int cvId);
        List<Cv> ListGoodCvs();
        void UpdateCvStatusIfNecessary(CvHistory cvEventForHistory);
        void PinFileToCv(int cvId, string fileName, string urlToStoreFile);
        void FinishCvReview(Cv cv);
        public Task<string> GenerateCViewerReportAsync(DateTime date, IAmazonS3Service amazonS3Service);
    }
}
