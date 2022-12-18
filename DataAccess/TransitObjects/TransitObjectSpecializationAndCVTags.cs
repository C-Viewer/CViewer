using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess.TransitObjects
{
    public class TransitObjectSpecializationAndCVTags
    {
        public Specialization Specialization { get; set; }
        public List<Tag> CVTags { get; set; }
    }
}
