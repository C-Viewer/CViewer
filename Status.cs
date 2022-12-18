using System;
using System.Collections.Generic;
using CViewer.DataAccess.Entities;

namespace CViewer;

public partial class Status
{
    public int Id { get; set; }

    public string Name { get; set; }

    public virtual ICollection<Cv> Cvs { get; } = new List<Cv>();

    public virtual ICollection<Report> Reports { get; } = new List<Report>();
}
