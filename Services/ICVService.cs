using System.Net;
using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface ICVService
    {
        public CV CreateCVDraft(CV cv, int applicantId);
        public CV UpdateCVInfo(int cvId, string title = null, Specialization specialization = null, List<CVTag> tags = null, string description = null);
        public CVHistory AddEventToHistory(int cvId, DateTime dateTime, ICVService service, string fileName = null, string comment = null, double? grade = null, int? expertId = null);
        public List<CVHistory> ListCVHistories();
        public List<CVHistory> ListCVHistories(int cvId);
        public List<AttachedFile> ListAttachedFiles();
        public List<CV> ListCVs();
        public List<CV> ListCVsForProfile(string applicantOrExpertToken);
        public CV GetCV(int id);
        public CVHistory GetCVHistory(int id);
        public AttachedFile GetAttachedFile(int id);
        public List<CVTag> ListCVTags();
        public List<Specialization> ListSpecializations();
        //public bool Delete(int id);
    }
}
