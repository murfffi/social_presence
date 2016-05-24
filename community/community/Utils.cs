using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;

namespace community
{
    using PageSyncFilter = Func<Social_PresenceEntities, facebook_page, bool>;

    public class Utils
    {
        public static readonly PageSyncFilter SYNC_ALL_PAGES = (db, page) => true;

        public static readonly PageSyncFilter SYNC_NEW_PAGES =
            (db, page) => db.posts.FirstOrDefault(post => post.facebook_page_id == page.id) == null;  

        /// <summary>
        /// Synchronizes posts retrived from the ICommunityClient to the database
        /// </summary>
        /// <param name="client">Social presence data client</param>
        /// <param name="model">Database reference</param>
        /// <param name="filter">Must return true for the pages whose posts need to be synced. See predefined filters in Utils.</param>
        public static void SyncPosts(ICommunityClient client, Social_PresenceEntities model, PageSyncFilter filter)
        {
            var pages = new List<facebook_page>(model.facebook_page);
            foreach (var page in pages)
            {
                if (page.url == null || !filter(model, page))
                {
                    continue;
                }

                try
                {
                    Console.WriteLine("Retrieving posts for page {0}; id: {1}", page.url, page.id);
                    List<post> posts = client.GetPosts(page.url, page.contributor_email, page.id, Int32.MaxValue);
                    foreach (var newPost in posts)
                    {
                        var existingPost = model.posts.FirstOrDefault(p => p.id == newPost.id);
                        if (existingPost != null)
                        {
                            model.posts.Remove(existingPost);
                        }
                        model.posts.Add(newPost);
                        Console.WriteLine("Added new post with ID: " + newPost.id);
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("Error retrieving posts for page {0}: {1}.", page.url, e);
                }

                Console.WriteLine("Saving posts ...");
                model.SaveChanges();

            }
        }
    }
}