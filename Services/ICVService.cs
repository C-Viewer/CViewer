using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface ICVService
    {
        public CV CreateCVDraft(CV cv, int applicantId);
        public CV UpdateCVInfo(int cvId, string title = null, Specialization? specialization = null, List<CVTag> tags = null, string description = null);
        public CVHistory AddEventToHistory(int cvId, DateTime dateTime, ICVService service, string fileName = null, string applicantComment = null,
            string expertComment = null, double? grade = null);
        public CV Get(int id);
        public List<CV> List();
        public CV Update(CV cv);
        public bool Delete(int id);
    }
}
