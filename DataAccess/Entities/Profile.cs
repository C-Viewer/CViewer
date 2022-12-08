using System.ComponentModel.DataAnnotations;

namespace CViewer.DataAccess.Entities
{
    public enum AuthenticationType
    {
        ByEmailAndPassword,
        Gmail,
    }

    public enum Role
    {
        WithoutRole,
        Applicant,
        Expert,
    }

    public class Profile
    {

        [Required]
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        /// <summary>
        /// Todo: Add some hash function with salt.
        /// </summary>

        [Required]
        public string Password { get; set; }

        [Required]
        public string EmailAddress { get; set; }

        public string Biography { get; set; }

        [Required]
        public bool IsExpert { get; set; }
        public Specialization Specialization { get; set; }
        public double? Rating { get; set; }

        // ToDo: And so on...
    }
}
