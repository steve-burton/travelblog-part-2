﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TravelBlog.Models
{   [Table("Locations")]
    public class Location
    {
        public Location()
        {
            this.People = new HashSet<Person>();
        }
        [Key]
        public int LocationId { get; set; }
        public string LocationName { get; set; }
        public string LocationDescription { get; set; }
        public int PersonId { get; set; }
        public string LocationImage { get; set; }
        public virtual ICollection<Person> People { get; set; }
        public virtual ICollection<Experience> Experiences { get; set; }
        public virtual ICollection<Comment> Comments { get; set; }
        public virtual ApplicationUser User { get; set; }

        public override bool Equals(System.Object otherLocation)
        {
            if (!(otherLocation is Location))
            {
                return false;
            }
            else
            {
                Location newLocation = (Location)otherLocation;
                return this.LocationId.Equals(newLocation.LocationId);
            }
        }

        public override int GetHashCode()
        {
            return this.LocationId.GetHashCode();
        }
    }
}
