using Microsoft.AspNetCore.SignalR;

namespace CViewer.DataAccess.Entities
{
    public class Token
    {
        public int Id { get; set; }
        public string Value { get; set; }
        public DateTime ExpirationDateTime { get; set; }
    }
}
