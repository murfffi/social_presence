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
        [Display(Order = 1)]
        public object name;

        [RegularExpression(Constants.URL_REGEX, ErrorMessage="The URL is invalid.")]
        [UIHint("Text")] // show as regular textbox, not multiline, even though max length is a lot
        [StringLength(1000)] 
        public object url;

        [RegularExpression(Constants.URL_REGEX, ErrorMessage = "The website is invalid.")]
        [UIHint("Text")] // show as regular textbox, not multiline, even though max length is a lot
        [StringLength(1000)]
        public object website;
    }

    [ScaffoldTable(true)]
    [DisplayName("Facebook Posts")]
    public partial class post
    {
        public override string ToString()
        {
            return new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(this);
        }
    }

    [ScaffoldTable(true)]
    [MetadataType(typeof(MunicipalityMetadata))]
    public partial class Municipality
    {
    }

    public class MunicipalityMetadata
    {
        [RegularExpression(Constants.URL_REGEX, ErrorMessage = "The website is invalid.")]
        [UIHint("Text")] // show as regular textbox, not multiline, even though max length is a lot
        [StringLength(1000)]
        public object website;
    }
}