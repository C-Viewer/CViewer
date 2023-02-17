using System;
using System.Collections.Generic;
using CViewer.DataAccess.Entities;
using Microsoft.EntityFrameworkCore;

namespace CViewer;

public partial class CViewerMgrDbContext : DbContext
{
    public CViewerMgrDbContext()
    {
    }

    public CViewerMgrDbContext(DbContextOptions<CViewerMgrDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Cv> Cvs { get; set; }

    public virtual DbSet<CvExpert> CvExperts { get; set; }

    public virtual DbSet<CvHistory> CvHistories { get; set; }

    public virtual DbSet<CvTag> CvTags { get; set; }

    public virtual DbSet<Profile> Profiles { get; set; }

    public virtual DbSet<ProfileLog> ProfileLogs { get; set; }

    public virtual DbSet<ProfileToToken> ProfileToTokens { get; set; }

    public virtual DbSet<Report> Reports { get; set; }

    public virtual DbSet<Specialization> Specializations { get; set; }

    public virtual DbSet<Status> Statuses { get; set; }

    public virtual DbSet<Tag> Tags { get; set; }

    public virtual DbSet<Token> Tokens { get; set; }

    public virtual DbSet<TypesOfLog> TypesOfLogs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var configuration = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json")
            .Build();

        var connectionString = configuration.GetConnectionString("CViewer");
        optionsBuilder.UseSqlServer(connectionString);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Cv>(entity =>
        {
            entity.ToTable("cv");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DateCreation)
                .HasColumnType("datetime")
                .HasColumnName("date_creation");
            entity.Property(e => e.Description)
                .IsRequired()
                .IsUnicode(false)
                .HasColumnName("description");
            entity.Property(e => e.GoodCv).HasColumnName("good_cv");
            entity.Property(e => e.Grade).HasColumnName("grade");
            entity.Property(e => e.OpenToReview).HasColumnName("open_to_review");
            entity.Property(e => e.PeopleCreatedId).HasColumnName("people_created_id");
            entity.Property(e => e.PinnedFileName)
                .IsUnicode(false)
                .HasColumnName("pinned_file_name");
            entity.Property(e => e.SpecializationId).HasColumnName("specialization_id");
            entity.Property(e => e.StatusId).HasColumnName("status_id");
            entity.Property(e => e.Title)
                .IsRequired()
                .IsUnicode(false)
                .HasColumnName("title");
            entity.Property(e => e.UrlFileForDownload)
                .IsUnicode(false)
                .HasColumnName("url_file_for_download");

            entity.HasOne(d => d.PeopleCreated).WithMany(p => p.Cvs)
                .HasForeignKey(d => d.PeopleCreatedId)
                .HasConstraintName("FK_cv_people");

            entity.HasOne(d => d.Specialization).WithMany(p => p.Cvs)
                .HasForeignKey(d => d.SpecializationId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_cv_specialization");

            entity.HasOne(d => d.Status).WithMany(p => p.Cvs)
                .HasForeignKey(d => d.StatusId)
                .HasConstraintName("FK_cv_status");

            //entity.HasMany(e => e.CvExperts).WithMany(p => p.Cvs).UsingEntity<CvExpert>(
            //    j => j
            //    .HasOne(pt => pt.Cv)
            //    .WithMany(t => t.CvExperts)

            //    )
        });

        modelBuilder.Entity<CvExpert>(entity =>
        {
            entity.ToTable("cv_expert");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CvId).HasColumnName("cv_id");
            entity.Property(e => e.ProfileId).HasColumnName("profile_id");

            entity.HasOne(d => d.Cv).WithMany(p => p.CvExperts)
                .HasForeignKey(d => d.CvId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_cv_expert_cv");

            entity.HasOne(d => d.Profile).WithMany(p => p.CvExperts)
                .HasForeignKey(d => d.ProfileId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_cv_expert_people");
        });

        modelBuilder.Entity<CvHistory>(entity =>
        {
            entity.ToTable("cv_history");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AmazonPathToFile)
                .IsUnicode(false)
                .HasColumnName("amazon_path_to_file");
            entity.Property(e => e.AuthorId).HasColumnName("author_id");
            entity.Property(e => e.Comment)
                .IsUnicode(false)
                .HasColumnName("comment");
            entity.Property(e => e.CvId).HasColumnName("cv_id");
            entity.Property(e => e.DateTime)
                .HasColumnType("datetime")
                .HasColumnName("date_time");
            entity.Property(e => e.FileName)
                .IsUnicode(false)
                .HasColumnName("file_name");
            entity.Property(e => e.Grade).HasColumnName("grade");

            entity.HasOne(d => d.Author).WithMany(p => p.CvHistories)
                .HasForeignKey(d => d.AuthorId)
                .HasConstraintName("FK_cv_history_profile");

            entity.HasOne(d => d.Cv).WithMany(p => p.CvHistories)
                .HasForeignKey(d => d.CvId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_cv_history_cv");
        });

        modelBuilder.Entity<CvTag>(entity =>
        {
            entity.ToTable("cv_tags");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CvId).HasColumnName("cv_id");
            entity.Property(e => e.TagId).HasColumnName("tag_id");

            entity.HasOne(d => d.Cv).WithMany(p => p.CvTags)
                .HasForeignKey(d => d.CvId)
                .HasConstraintName("FK_cv_tags_cv");

            entity.HasOne(d => d.Tag).WithMany(p => p.CvTags)
                .HasForeignKey(d => d.TagId)
                .HasConstraintName("FK_cv_tags_tags");
        });

        modelBuilder.Entity<Profile>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_people");

            entity.ToTable("profile");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Biography)
                .IsUnicode(false)
                .HasColumnName("biography");
            entity.Property(e => e.DateRegistation)
                .HasColumnType("datetime")
                .HasColumnName("date_registation");
            entity.Property(e => e.EmailAddress)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("email_address");
            entity.Property(e => e.FirstName)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("first_name");
            entity.Property(e => e.IsExpert).HasColumnName("is_expert");
            entity.Property(e => e.LastName)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("last_name");
            entity.Property(e => e.Password)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Rating).HasColumnName("rating");
            entity.Property(e => e.SpecializationId).HasColumnName("specialization_id");

            entity.HasOne(d => d.Specialization).WithMany(p => p.Profiles)
                .HasForeignKey(d => d.SpecializationId)
                .HasConstraintName("FK_people_specialization");
        });

        modelBuilder.Entity<ProfileLog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_people_log");

            entity.ToTable("profile_log");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Date)
                .HasColumnType("datetime")
                .HasColumnName("date");
            entity.Property(e => e.New)
                .IsUnicode(false)
                .HasColumnName("new");
            entity.Property(e => e.Old)
                .IsUnicode(false)
                .HasColumnName("old");
            entity.Property(e => e.ProfileId).HasColumnName("profile_id");
            entity.Property(e => e.TypeId).HasColumnName("type_id");

            entity.HasOne(d => d.Profile).WithMany(p => p.ProfileLogs)
                .HasForeignKey(d => d.ProfileId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_people_log_people");

            entity.HasOne(d => d.Type).WithMany(p => p.ProfileLogs)
                .HasForeignKey(d => d.TypeId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_people_log_types");
        });

        modelBuilder.Entity<ProfileToToken>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_people_token");

            entity.ToTable("profile_to_token");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.ProfileId).HasColumnName("profile_id");
            entity.Property(e => e.TokenId).HasColumnName("token_id");

            entity.HasOne(d => d.Profile).WithMany(p => p.ProfileToTokens)
                .HasForeignKey(d => d.ProfileId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_people_token_people");

            entity.HasOne(d => d.Token).WithMany(p => p.ProfileToTokens)
                .HasForeignKey(d => d.TokenId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_people_token_token");
        });

        modelBuilder.Entity<Report>(entity =>
        {
            entity.ToTable("report");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AuthorId).HasColumnName("author_id");
            entity.Property(e => e.CreatedDate)
                .HasColumnType("datetime")
                .HasColumnName("created_date");
            entity.Property(e => e.ProfileId).HasColumnName("profile_id");
            entity.Property(e => e.Rating).HasColumnName("rating");
            entity.Property(e => e.StatusId).HasColumnName("status_id");
            entity.Property(e => e.Text)
                .IsUnicode(false)
                .HasColumnName("text");

            entity.HasOne(d => d.Author).WithMany(p => p.ReportAuthors)
                .HasForeignKey(d => d.AuthorId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_report_profile1");

            entity.HasOne(d => d.Profile).WithMany(p => p.ReportProfiles)
                .HasForeignKey(d => d.ProfileId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_report_profile");

            entity.HasOne(d => d.Status).WithMany(p => p.Reports)
                .HasForeignKey(d => d.StatusId)
                .HasConstraintName("FK_report_status");
        });

        modelBuilder.Entity<Specialization>(entity =>
        {
            entity.ToTable("specialization");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("name");
        });

        modelBuilder.Entity<Status>(entity =>
        {
            entity.ToTable("status");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Tag>(entity =>
        {
            entity.ToTable("tags");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("name");
        });

        modelBuilder.Entity<Token>(entity =>
        {
            entity.ToTable("token");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.ExpirationDateTime)
                .HasColumnType("datetime")
                .HasColumnName("expiration_date_time");
            entity.Property(e => e.Value)
                .IsRequired()
                .IsUnicode(false)
                .HasColumnName("value");
        });

        modelBuilder.Entity<TypesOfLog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_types");

            entity.ToTable("types_of_logs");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .IsRequired()
                .HasMaxLength(50)
                .HasColumnName("name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
