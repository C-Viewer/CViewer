using CViewer.DataAccess.Entities;

namespace CViewer.DataAccess
{
    public class EntitiesHelper
    {
        public class CVStatusTypeObject
        {
            public CVStatusTypeObject(CVStatusType cVStatusType)
            {
                CVStatusType = cVStatusType;
            }

            public CVStatusType CVStatusType { get; }
        }
    }
}
