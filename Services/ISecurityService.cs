using CViewer.DataAccess.Entities;

namespace CViewer.Services
{
    public interface ISecurityService
    {
        public bool CheckAccess(string tokenValue);
    }
}
