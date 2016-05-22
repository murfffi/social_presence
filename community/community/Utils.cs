using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;

namespace community
{
    public class Utils
    {
        public static Control FindDataControlRecursive(Control rootControl, string columnName, TraceContext traceContext)
        {
            if (rootControl is FieldTemplateUserControl)
            {
                FieldTemplateUserControl ctrl = (FieldTemplateUserControl)rootControl;
                traceContext.Write("Column: " + ctrl.Column.Name);
                if (ctrl.Column.Name == columnName) return ctrl;
            }

            traceContext.Write(rootControl.GetType().Name);
            foreach (Control controlToSearch in rootControl.Controls)
            {
                Control controlToReturn =
                    FindDataControlRecursive(controlToSearch, columnName, traceContext);
                if (controlToReturn != null) return controlToReturn;
            }
            return null;
        }

        public static void SyncPosts()
        {
            IFbClient client = new CommunityFbClient(1000);
            Social_PresenceEntities model = new Social_PresenceEntities();
            SyncPosts(client, model);
            model.SaveChanges();
        }

        public static void SyncPosts(IFbClient client, Social_PresenceEntities model)
        {
            foreach (var page in model.facebook_page)
            {
                if (page.website == null)
                {
                    continue;
                }

                try
                {
                    Console.WriteLine("Retrieving posts for page {0}; id: {1}", page.website, page.id);
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

            }
        }
    }
}