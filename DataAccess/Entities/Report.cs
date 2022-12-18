using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class Report
{
    public int Id { get; set; }

    public int? StatusId { get; set; }

    public string Text { get; set; }

    public int PeopleId { get; set; }

    public int Rating { get; set; }

    public DateTime CreatedDate { get; set; }

    public int AuthorId { get; set; }

    public virtual Profile People { get; set; }

    public virtual Status Status { get; set; }
}
