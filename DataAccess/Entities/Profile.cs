namespace CViewer.DataAccess.Entities
{
    public enum AuthenticationType
    {
        ByEmailAndPassword,
        Gmail,
    }

    public class Profile
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }

        /// <summary>
        /// Todo: Add some hash function with salt.
        /// </summary>
        public string Password { get; set; }
        public string EmailAddress { get; set; }

        public string Biography { get; set; }
        public bool IsExpert { get; set; }
        public int SpecializationId { get; set; }
        public double? Rating { get; set; }

        // ToDo: And so on...
    }
}
