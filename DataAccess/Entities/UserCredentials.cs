using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    /// <summary>
    /// For register and login.
    /// </summary>
    public class UserCredentials
    {
        [Required]
        public string EmailAddress { get; set; }
        [Required]
        public string Password { get; set; }
    }
}