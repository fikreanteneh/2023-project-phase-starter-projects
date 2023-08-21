using Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure;

public class SocialSyncDbContext : DbContext
{
    public virtual DbSet<Post> Posts { get; set; }
    // public virtual DbSet<Comment> Comments { get; set; }
        
    public SocialSyncDbContext(DbContextOptions<SocialSyncDbContext> options) : base(options) { }

    // Used for model creating and It creates the table with this configurations
    protected override void OnModelCreating(ModelBuilder modelBuilder) {
        
        // modelBuilder.Entity<Comment>(
        //     entity => {
        //         entity.HasOne(e => e.Post)
        //             .WithMany(e => e.Comments)
        //             .HasForeignKey(e => e.PostId)
        //             .OnDelete(DeleteBehavior.Cascade)
        //             .HasConstraintName("FK_Comment_Post");
        //     }
        // );
        //
        // modelBuilder.Entity<Comment>()
        //     .Property(c => c.CreatedAt)
        //     .HasDefaultValueSql("CURRENT_TIMESTAMP AT TIME ZONE 'UTC'");
        //
        // modelBuilder.Entity<Comment>()
        //     .Property(p => p.Id)
        //     .UseIdentityColumn();
        //     
        // modelBuilder.Entity<Post>()
        //     .Property(p => p.Id)
        //     .UseIdebtityColumn();
        //         
        // modelBuilder.Entity<Post>()
        //     .Property(c => c.CreatedAt)
        //     .HasDefaultValueSql("CURRENT_TIMESTAMP AT TIME ZONE 'UTC'");
    }
    
}