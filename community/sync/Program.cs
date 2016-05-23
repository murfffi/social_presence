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
            Utils.SyncPosts(Utils.SYNC_NEW_PAGES);
        }
    }
}
