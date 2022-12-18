using System;
using System.Collections.Generic;
using CViewer.DataAccess.Entities;

namespace CViewer;

public partial class CvExpert
{
    public int Id { get; set; }

    public int CvId { get; set; }

    public int ExpertId { get; set; }

    public virtual Cv Cv { get; set; }

    public virtual Profile Expert { get; set; }
}
