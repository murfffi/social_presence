using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using community;
using System.Data.Entity;
using System.Collections.Generic;

namespace tests
{
    [TestClass]
    public class UtilsTest
    {
        [TestMethod]
        public void TestSyncPosts_Happy()
        {
            var mockContext = new Mock<Social_PresenceEntities>();
            var mockPostDbSet = new Mock<DbSet<post>>();
            mockContext.Setup(m => m.posts).Returns(mockPostDbSet.Object);
            var mockClient = new Mock<IFbClient>();

            mockClient.Setup(m => m.GetPosts("https://facebook.com/page1", "page1@example.com", 1, Int32.MaxValue))
                .Returns(makePosts(1));
            Utils.SyncPosts(mockClient.Object, mockContext.Object);
        }

        private List<post> makePosts(int pageId)
        {
            var page1Posts = new List<post>();
            page1Posts.Add(makePost(pageId));
            return page1Posts;
        }

        private post makePost(int page)
        {
            post p = new post();
            p.title = "page" + page + " title";
            return p;
        }
    }
}
