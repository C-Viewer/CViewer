using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class CvExpert
{
    public int Id { get; set; }

    public int CvId { get; set; }

    public int ExpertId { get; set; }

    public virtual CV CV { get; set; }

    public virtual Profile Expert { get; set; }
}
