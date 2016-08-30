using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace community
{
    [ScaffoldTable(true)]
    [DisplayName("Facebook Pages")]
    [MetadataType(typeof(FacebookPageMetadata))]
    public partial class facebook_page
    {
    }

    public class FacebookPageMetadata
    {
        [Display(Order=1, Description="Municipality name")]
        public object Municipality;

        [Display(Order = 2, Name = "URL", Description = "Municipality Facebook page link")]
        [RegularExpression(Constants.URL_REGEX, ErrorMessage = "The URL is invalid.")]
        [UIHint("FBPageLink")]
        [StringLength(1000)]
        public object url;

        [Display(Order = 3, Name = "Title", Description = "Municipality Facebook page title")]
        public object name;

        [Display(Order = 4, Name = "Category", Description = "Municipality Facebook page category")]
        public object category;

        [Display(Order = 5, Name = "Creation date", Description = "Municipality Facebook page creation date")]
        public object creation_date;

        [Display(Order = 6, Name = "Defined location", Description = "Defined location in municipality Facebook page")]
        public object defined_location;

        [Display(Order = 7, Name = "Municipality website", Description = "Displayed municipality website in Facebook page")]
        [RegularExpression(Constants.URL_REGEX, ErrorMessage = "The website is invalid.")]
        [UIHint("Url")] // show as regular textbox, not multiline, even though max length is a lot
        [StringLength(1000)]
        public object website;

        [Display(Order = 8, Name = "Facebook page short name", Description = "Defined short name in municipality Facebook page")]
        public object short_name;

        [Display(Order = 9, Name = "Has phone", Description = "Displayed phone in municipality Facebook page")]
        public object has_phone;

        [Display(Order = 10, Name = "Has email", Description = "Displayed email in municipality Facebook page")]
        public object has_email;

        [Display(Order = 11, Name = "Has about page", Description = "Existance of About page in municipality Facebook page")]
        public object has_about_page;

        [Display(Order = 12, Name = "Milestones count", Description = "Milestones count(if there is such) in municipality Facebook page")]
        public object milestones_count;

        [Display(Order = 13, Name = "Liked pages count", Description = "Number of liked pages in municipality Facebook page")]
        public object liked_pages;

        [Display(Order = 14, Name = "Approved", Description = "This field is authomatically filled up. Only administrator can change its value")]
        public object approved;

        [Display(Order = 15, Name = "Contributor email", Description = "This field is authomatically filled up with your Facebook profile email address")]
        public object contributor_email;
    }

    [ScaffoldTable(true)]
    [DisplayName("Facebook Posts")]
    [MetadataType(typeof(FacebookPostMetadata))]
    public partial class post
    {
        public override string ToString()
        {
            return new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(this);
        }
  
    }

    public class FacebookPostMetadata
    {
        //[Display(Name = "Post id", Description = "Facebook post id")]
         [ScaffoldColumn(false)]public object id;

        [Display(Name = "Title", Description = "Facebook post title")]
        public object title;

        [Display(Name = "Creation date", Description = "Facebook post creation date")]
        public object date;

        [Display(Name = "Likes", Description = "Likes count for Facebook post")]
        public object likes;

        [Display(Name = "Mentions", Description = "Mentions count for Facebook post")]
        public object mentions;

        [Display(Name = "Post type", Description = "Type of Facebook post")]
        public object type;

        [Display(Name = "Length", Description = "Length of Facebook post")]
        public object length;

        [Display(Name = "Contains hashtags", Description = "Does this Facebook post contain hashtags?")]
        public object contains_hashtags;

        [Display(Name = "Has responses", Description = "Does this Facebook post has responses?")]
        public object has_responses;

        [Display(Name = "Fan post", Description = "Is this a fan post?")]
        public object fan_post;

        [Display(Name = "Approved", Description = "This field is authomatically filled up. Only administrator can change its value")]
        public object approved;

        [Display(Name = "Contributor email", Description = "This field is authomatically filled up with your Facebook profile email address")]
        public object contributor_email;

        [Display(Name = "Facebook page", Description = "URL of the Facebook page for this post")]
        public object facebook_page;
    }

    [ScaffoldTable(true)]
    [MetadataType(typeof(MunicipalityMetadata))]
    public partial class Municipality
    {
    }

    public class MunicipalityMetadata
    {
        [Display(Order = 1, Name = "Name", Description = "Municipality name")]
        public object name;

        [Display(Order = 2, Name = "Region", Description = "Municipality region")]
        public object state;

        [Display(Order = 3, Name = "Country", Description = "Municipality country")]
        public object country;

        [Display(Order = 4, Name = "Population", Description = "Municipality population")]
        public object population;

        [Display(Order = 5, Name = "Website", Description = "Municipality website")]
        [RegularExpression(Constants.URL_REGEX, ErrorMessage = "The website is invalid.")]
        [UIHint("Url")]
        [StringLength(1000)]
        public object website;

        [Display(Order = 6, Name = "Approved", Description = "This field is authomatically filled up. Only administrator can change its value")]
        public object approved;

        [Display(Order = 7, Name = "Contributor email", Description = "This field is authomatically filled up with your Facebook profile email address")]
        public object contributor_email;

        [Display(Order = 8, Name = "Facebook page data form", Description = "View data form")]
        [UIHint("MunicipalityChildren")]
        public object facebook_page;
    }
}