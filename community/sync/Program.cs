using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using community;

namespace sync
{
    class Program
    {
        static void Main(string[] args)
        {
            ICommunityClient client = new CommunityFbClient(1000);
            Social_PresenceEntities model = new Social_PresenceEntities();
            Utils.SyncPosts(client, model, Utils.SYNC_NEW_PAGES);
        }
    }
}
