using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class CVHistory
{
    public int Id { get; set; }

    public string FileName { get; set; }

    public int CVId { get; set; }

    public string Comment { get; set; }

    public DateTime DateTime { get; set; }

    public int? AuthorId { get; set; }

    public int? Grade { get; set; }

    public string AmazonPathToFile { get; set; }

    public virtual CV CV { get; set; }
}
