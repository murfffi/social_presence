using Facebook;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;

namespace community
{
    public class CommunityFbClient : IFbClient
    {
        private readonly FacebookClient client = new FacebookClient("541069762740573|onSnaCSnHAUqceURGGh9e7pMMX8");
        private int delayMillis;

        public CommunityFbClient(int delayMillis)
        {
            this.delayMillis = delayMillis;
        }

        public List<post> GetPosts(String page, String contributorEmail, int pageId, int limit)
        {
            var result = new List<post>();
            if (!page.StartsWith("http") || !page.Contains("facebook.com")) 
            {
                return result;
            }
            dynamic info;
            try
            {
                Uri pageUri = new Uri(page);
                if (pageUri.AbsolutePath == null || pageUri.AbsolutePath.Length == 0)
                {
                    return result;
                }
                info = Get(pageUri.AbsolutePath + "/posts?fields=created_time,story,message,type,shares");
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return result;
            }

            if (info.data == null)
            {
                Console.WriteLine("Error: " + info);
                return result;
            }

            foreach (dynamic facebookPost in info.data)
            {
                if (limit-- == 0)
                {
                    break;
                }
                post newPost = new post();
                newPost.approved = true;
                newPost.contributor_email = contributorEmail;
                if (facebookPost.created_time != null)
                {
                    newPost.date = DateTime.Parse(facebookPost.created_time);
                }

                newPost.title = facebookPost.story;
                string msg = facebookPost.message;
                if (msg != null)
                {
                    newPost.length = msg.Length;
                    newPost.contains_hashtags = msg.Contains("#");
                    if (newPost.title == null)
                    {
                        newPost.title = msg.Substring(0, Math.Min(100, msg.Length)) + "...";
                    }
                }
                if (newPost.title == null)
                {
                    newPost.title = "No title";
                }
                newPost.type = facebookPost.type;
                newPost.fan_post = false;
                newPost.has_responses = HasPostResponses(facebookPost.id);
                newPost.likes = (int)GetPostLikes(facebookPost.id);                
                newPost.facebook_page_id = pageId;
                newPost.id = facebookPost.id;
                newPost.mentions = facebookPost.shares != null ? (int)facebookPost.shares.count : 0;

                Console.WriteLine("Retrieved post: " + newPost);
                result.Add(newPost);
            }

            return result;
        }

        private bool HasPostResponses(string id)
        {
            dynamic result = Get(id + "/comments");
            return result.data.Count > 0;
        }

        private Int64 GetPostLikes(string id)
        {
            dynamic result = Get(id + "/likes?summary=true");
            return result.summary.total_count;
        }

        private dynamic Get(string request)
        {
            dynamic result = client.Get(request);
            Thread.Sleep(delayMillis);
            return result;
        }
    }
}