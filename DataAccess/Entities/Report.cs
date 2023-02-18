using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class Report
{
    public int Id { get; set; }

    public int? StatusId { get; set; }

    public string Text { get; set; }

    public int ProfileId { get; set; }

    public int Rating { get; set; }

    public DateTime CreatedDate { get; set; }

    public int AuthorId { get; set; }

    public virtual Profile Author { get; set; }

    public virtual Profile Profile { get; set; }

    public virtual Status Status { get; set; }
}
