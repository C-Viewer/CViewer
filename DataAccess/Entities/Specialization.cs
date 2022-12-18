using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class Specialization
{
    public int Id { get; set; }

    public string Name { get; set; }

    public virtual ICollection<CV> Cvs { get; } = new List<CV>();

    public virtual ICollection<Profile> Profiles { get; } = new List<Profile>();
}
