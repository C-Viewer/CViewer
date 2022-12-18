using System;
using System.Collections.Generic;

namespace CViewer;

public partial class Tag
{
    public int Id { get; set; }

    public string Name { get; set; }

    public virtual ICollection<CvTag> CvTags { get; } = new List<CvTag>();
}
