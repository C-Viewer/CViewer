using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class CvTag
{
    public int CvId { get; set; }

    public int TagId { get; set; }

    public int Id { get; set; }

    public virtual Cv Cv { get; set; }

    public virtual Tag Tag { get; set; }
}
