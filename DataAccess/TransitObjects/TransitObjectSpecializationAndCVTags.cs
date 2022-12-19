using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.TransitObjects
{
    public class TransitObjectSpecializationAndCVTags
    {
        public Specialization Specialization { get; set; }
        public List<CVTag> CVTags { get; set; }
    }
}
