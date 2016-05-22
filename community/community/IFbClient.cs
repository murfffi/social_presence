using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace community
{
    public interface IFbClient
    {
        List<post> GetPosts(String page, String contributorEmail, int pageId, int limit);
    }
}
