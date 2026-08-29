using System;

namespace ACE.Database.Models.PkAudit;

public class PkPlayerState
{
    // Player unique id (object guid full)
    public uint PlayerId { get; set; }

    // Unix time (seconds) when player became PK
    public double PkTimestamp { get; set; }

    // PK level (as int from PKLevel enum)
    public int PkLevel { get; set; }

    // Counters
    public int PlayerKillsPk { get; set; }

    public int PlayerKillsPkl { get; set; }

    public DateTime LastUpdated { get; set; } = DateTime.UtcNow;
}
