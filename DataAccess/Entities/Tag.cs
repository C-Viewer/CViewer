﻿using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class Tag
{
    public int Id { get; set; }

    public string Name { get; set; }

    public virtual ICollection<CvTag> CvTags { get; } = new List<CvTag>();

    public List<Cv> Cvs { get; set; } = new List<Cv>();
}
