using System;
using System.Collections.Generic;

namespace CViewer.DataAccess.Entities;

public partial class ProfileToToken
{
    public int Id { get; set; }

    public int ProfileId { get; set; }

    public int TokenId { get; set; }

    public virtual Profile Profile { get; set; }

    public virtual Token Token { get; set; }
}
