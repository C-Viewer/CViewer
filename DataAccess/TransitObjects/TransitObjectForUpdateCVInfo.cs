using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.TransitObjects
{
    public class TransitObjectForUpdateCVInfo
    {
        public Specialization Specialization { get; set; }
        public List<CVTag> CVTags { get; set; }
    }
}
