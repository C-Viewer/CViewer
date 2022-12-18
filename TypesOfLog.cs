using System;
using System.Collections.Generic;

namespace CViewer;

public partial class TypesOfLog
{
    public int Id { get; set; }

    public string Name { get; set; }

    public virtual ICollection<ProfileLog> ProfileLogs { get; } = new List<ProfileLog>();
}
