using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class Token
{
    public int Id { get; set; }

    public string Value { get; set; }

    public DateTime ExpirationDateTime { get; set; }
}
