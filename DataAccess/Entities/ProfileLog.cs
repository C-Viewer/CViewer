using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class ProfileLog
{
    public int Id { get; set; }

    public int TypeId { get; set; }

    public DateTime Date { get; set; }

    public string Old { get; set; }

    public string New { get; set; }

    public int PeopleId { get; set; }

    public virtual Profile People { get; set; }

    public virtual TypesOfLog Type { get; set; }
}
