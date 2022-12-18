using System;
using System.Collections.Generic;

namespace CViewer;

public partial class CvHistory
{
    public int Id { get; set; }

    public string FileName { get; set; }

    public int CvId { get; set; }

    public string Comment { get; set; }

    public DateTime DateTime { get; set; }

    public int? AuthorId { get; set; }

    public int? Grade { get; set; }

    public string AmazonPathToFile { get; set; }

    public virtual Cv Cv { get; set; }
}
