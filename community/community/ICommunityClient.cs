using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace community
{
    /// <summary>
    /// Client for external source of social presence data e.g. Facebook
    /// </summary>
    public interface ICommunityClient
    {
        /// <summary>
        /// Retrieve posts for a particular page. Any errors are logged and ignored.
        /// </summary>
        /// <param name="page">the page URL e.g. https://www.facebook.com/ObshtinaBlagoevgrad </param>
        /// <param name="contributorEmail">the contributor email to assign to new posts</param>
        /// <param name="pageId">the ID of the page, corresponding to the URL</param>
        /// <param name="limit">retrieve up to that many posts; use Int32.MAX_VALUE for no limit</param>
        /// <returns>list of posts (approved=true); not null</returns>
        List<post> GetPosts(String page, String contributorEmail, int pageId, int limit);
    }
}
