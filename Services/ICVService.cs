using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface ICVService
    {
        public CV CreateCVDraft(CV cv, int applicantId);
        public CV Get(int id);
        public List<CV> List();
        public CV Update(CV cv);
        public bool Delete(int id);
    }
}
