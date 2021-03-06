//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SoftwareGroup.Mirrors.Repository
{
    using System;
    using System.Collections.Generic;
    
    public partial class UserProfile
    {
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string PasswordSalt { get; set; }
        public Nullable<System.DateTime> PasswordChangedDate { get; set; }
        public Nullable<System.DateTime> LastPasswordFailureDate { get; set; }
        public Nullable<int> PasswordFailuresSinceLastSuccess { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public int CreatedUserId { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public Nullable<int> UpdatedUserId { get; set; }
        public Nullable<System.DateTime> UpadtedDate { get; set; }
        public string Email { get; set; }
        public string PersonalPhone { get; set; }
        public string WorkPhone { get; set; }
    }
}
