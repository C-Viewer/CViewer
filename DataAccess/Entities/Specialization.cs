using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class Specialization
{
    public int Id { get; set; }

    public string Name { get; set; }

    public virtual ICollection<Cv> Cvs { get; } = new List<Cv>();

    public virtual ICollection<Profile> Profiles { get; } = new List<Profile>();
}
