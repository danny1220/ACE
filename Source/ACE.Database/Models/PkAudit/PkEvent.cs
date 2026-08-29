using System;

namespace ACE.Database.Models.PkAudit;

public class PkEvent
{
    public long Id { get; set; }

    public DateTime Timestamp { get; set; } = DateTime.UtcNow;

    public uint KillerId { get; set; }

    public uint VictimId { get; set; }

    public string Zone { get; set; }

    public string Details { get; set; }
}
