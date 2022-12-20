using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class Profile
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

    public int Id { get; set; }

    public string FirstName { get; set; }

    public string EmailAddress { get; set; }

    public string Password { get; set; }

    public string Biography { get; set; }

    public bool IsExpert { get; set; }

    public int SpecializationId { get; set; }

    public DateTime? DateRegistation { get; set; }

    public double? Rating { get; set; }

    public string LastName { get; set; }

    public virtual ICollection<CvExpert> CvExperts { get; } = new List<CvExpert>();

    public virtual ICollection<CvHistory> CvHistories { get; } = new List<CvHistory>();

    public virtual ICollection<Cv> Cvs { get; } = new List<Cv>();

    public virtual ICollection<ProfileLog> ProfileLogs { get; } = new List<ProfileLog>();

    public virtual ICollection<ProfileToToken> ProfileToTokens { get; } = new List<ProfileToToken>();

    public virtual ICollection<Report> ReportAuthors { get; } = new List<Report>();

    public virtual ICollection<Report> ReportProfiles { get; } = new List<Report>();

    public virtual Specialization Specialization { get; set; }

    public List<Cv> Cvs2 { get; set; } = new List<Cv>();
}
