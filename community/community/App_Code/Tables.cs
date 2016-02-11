using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace community
{
    [DisplayName("Facebook Pages")]
    [MetadataType(typeof(FacebookPageMetadata))]
    public partial class facebook_page
    {
    }

    public class FacebookPageMetadata
    {
        [RegularExpression(Constants.URL_REGEX, ErrorMessage="The URL is invalid.")]
        [UIHint("Text")] // show as regular textbox, not multiline, even though max length is a lot
        [StringLength(1000)] 
        public object url;

        [RegularExpression(Constants.URL_REGEX, ErrorMessage = "The website is invalid.")]
        [UIHint("Text")] // show as regular textbox, not multiline, even though max length is a lot
        [StringLength(1000)]
        public object website;
    }

    [DisplayName("Facebook Posts")]
    public partial class post
    {
    }

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

    [ReadOnly(true)]
    public partial class Contributor
    {
    }
}