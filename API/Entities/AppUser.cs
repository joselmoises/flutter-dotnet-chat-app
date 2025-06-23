using Microsoft.AspNetCore.Identity;

namespace API.Entities
{
    public class AppUser : IdentityUser<int>
    {
        public DateTime Created { get; set; } = DateTime.UtcNow;
        public DateTime LasActive { get; set; } = DateTime.UtcNow;
        public string? Bio { get; set; }
        public string? Photo { get; set; }

        public List<Message>? MessagesSent { get; set; }
        public List<Message>? MessagesReceived { get; set; }
        public ICollection<AppUserRole>? UserRoles { get; set; }
    }
}