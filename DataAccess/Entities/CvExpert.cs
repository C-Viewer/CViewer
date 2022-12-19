using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class CvExpert
{
    public int Id { get; set; }

    public int CvId { get; set; }

    public int ProfileId { get; set; }

    public virtual Cv Cv { get; set; }

    public virtual Profile Profile { get; set; }
}
