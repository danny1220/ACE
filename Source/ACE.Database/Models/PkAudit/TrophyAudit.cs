using System;

namespace ACE.Database.Models.PkAudit;

public class TrophyAudit
{
    public long Id { get; set; }

    public DateTime Timestamp { get; set; } = DateTime.UtcNow;

    public uint PlayerId { get; set; }

    public uint TrophyId { get; set; }

    public string Description { get; set; }
}
