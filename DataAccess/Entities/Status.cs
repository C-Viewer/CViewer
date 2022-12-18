using System;
using System.Collections.Generic;
using CViewer.DataAccess.Repositories;

namespace CViewer.DataAccess.Entities;

public partial class Status
{
    public int Id { get; set; }

    public CVStatusType Name { get; set; }

    public virtual ICollection<CV> Cvs { get; } = new List<CV>();

    public virtual ICollection<Report> Reports { get; } = new List<Report>();
}
