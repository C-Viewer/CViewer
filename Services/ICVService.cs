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
        public string StoreFile(IFormFile file);
        public void PinToHistory(string fileName, string urlForDownload, int cvId);
        public CV UpdateCVInfo(int cvId, string title = null, Specialization specialization = null, List<CVTag> tags = null, string description = null);
        public CVHistory AddEventToHistory(CVHistoryParameter cvHistoryParameter);
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
        void TakeCvToReview(int cvId, int expertId);
    }
}
