using Microsoft.EntityFrameworkCore;

namespace ACE.Database.Models.PkAudit;

public partial class PkAuditDbContext : DbContext
{
    public PkAuditDbContext()
    {
    }

    public PkAuditDbContext(DbContextOptions<PkAuditDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<PkEvent> PkEvent { get; set; }

    public virtual DbSet<TrophyAudit> TrophyAudit { get; set; }

    public virtual DbSet<PkPlayerState> PkPlayerState { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            var config = Common.ConfigManager.Config.MySql.PkAudit;

            var connectionString = $"server={config.Host};port={config.Port};user={config.Username};password={config.Password};database={config.Database};{config.ConnectionOptions}";

            optionsBuilder.UseMySql(connectionString, DatabaseManager.CachedServerVersionAutoDetect(config.Database, connectionString), builder =>
            {
                builder.EnableRetryOnFailure(10);
            });

            if (config.EnableDetailedErrors)
                optionsBuilder.EnableDetailedErrors();

            if (config.EnableSensitiveDataLogging)
                optionsBuilder.EnableSensitiveDataLogging();
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8_general_ci")
            .HasCharSet("utf8mb3");

        modelBuilder.Entity<PkEvent>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");
            entity.ToTable("pk_event");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Timestamp).HasColumnName("timestamp");
            entity.Property(e => e.KillerId).HasColumnName("killer_id");
            entity.Property(e => e.VictimId).HasColumnName("victim_id");
            entity.Property(e => e.Zone).HasMaxLength(255).HasColumnName("zone");
            entity.Property(e => e.Details).HasColumnType("text").HasColumnName("details");
            entity.HasIndex(e => e.KillerId, "idx_pk_event_killer_id");
            entity.HasIndex(e => e.VictimId, "idx_pk_event_victim_id");
            entity.HasIndex(e => e.Timestamp, "idx_pk_event_timestamp");
        });

        modelBuilder.Entity<TrophyAudit>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PRIMARY");
            entity.ToTable("trophy_audit");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Timestamp).HasColumnName("timestamp");
            entity.Property(e => e.PlayerId).HasColumnName("player_id");
            entity.Property(e => e.TrophyId).HasColumnName("trophy_id");
            entity.Property(e => e.Description).HasColumnType("text").HasColumnName("description");
            entity.HasIndex(e => e.PlayerId, "idx_trophy_audit_player_id");
            entity.HasIndex(e => e.TrophyId, "idx_trophy_audit_trophy_id");
            entity.HasIndex(e => e.Timestamp, "idx_trophy_audit_timestamp");
        });

        modelBuilder.Entity<PkPlayerState>(entity =>
        {
            entity.HasKey(e => e.PlayerId).HasName("pk_player_state_pk");
            entity.ToTable("pk_player_state");

            entity.Property(e => e.PlayerId).HasColumnName("player_id");
            entity.Property(e => e.PkTimestamp).HasColumnName("pk_timestamp");
            entity.Property(e => e.PkLevel).HasColumnName("pk_level");
            entity.Property(e => e.PlayerKillsPk).HasColumnName("player_kills_pk");
            entity.Property(e => e.PlayerKillsPkl).HasColumnName("player_kills_pkl");
            entity.Property(e => e.LastUpdated)
                .ValueGeneratedOnAddOrUpdate()
                .HasDefaultValueSql("CURRENT_TIMESTAMP")
                .HasColumnType("datetime")
                .HasColumnName("last_updated");

            entity.HasIndex(e => e.PlayerId, "idx_pk_player_state_player_id");
        });
    }
}
