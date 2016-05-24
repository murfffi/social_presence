using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using community;
using System.Data.Entity;
using System.Collections.Generic;
using System.Linq;

namespace tests
{
    [TestClass]
    public class UtilsTest
    {
        [TestMethod]
        public void TestSyncPosts_NoPosts()
        {
            var mockContext = new Mock<Social_PresenceEntities>();
            var mockPostDbSet = mockDbSet(new List<post>());
            mockContext.Setup(m => m.posts).Returns(mockPostDbSet.Object);

            var mockPageDbSet = mockDbSet(new List<facebook_page>() { makePage(1) });
            mockContext.Setup(m => m.facebook_page).Returns(mockPageDbSet.Object);

            var mockClient = new Mock<ICommunityClient>();

            var testPosts = makePosts(1, 1);
            mockClient.Setup(m => m.GetPosts("https://facebook.com/page1", "page1@example.com", 1, Int32.MaxValue))
                .Returns(testPosts);
            Utils.SyncPosts(mockClient.Object, mockContext.Object, Utils.SYNC_ALL_PAGES);

            mockPostDbSet.Verify(m => m.Add(testPosts[0]), Times.Once());
        }

        [TestMethod]
        public void TestSyncPosts_UpdatePost()
        {
            var mockContext = new Mock<Social_PresenceEntities>();
            var testPosts = makePosts(1, 1);
            var mockPostDbSet = mockDbSet(testPosts);
            mockContext.Setup(m => m.posts).Returns(mockPostDbSet.Object);

            var mockPageDbSet = mockDbSet(new List<facebook_page>() { makePage(1) });
            mockContext.Setup(m => m.facebook_page).Returns(mockPageDbSet.Object);

            var mockClient = new Mock<ICommunityClient>();

            mockClient.Setup(m => m.GetPosts("https://facebook.com/page1", "page1@example.com", 1, Int32.MaxValue))
                .Returns(testPosts);
            Utils.SyncPosts(mockClient.Object, mockContext.Object, Utils.SYNC_ALL_PAGES);

            mockPostDbSet.Verify(m => m.Remove(testPosts[0]), Times.Once());
            mockPostDbSet.Verify(m => m.Add(testPosts[0]), Times.Once());
        }

        [TestMethod]
        public void TestSyncPosts_Multipage()
        {
            var mockContext = new Mock<Social_PresenceEntities>();
            var mockPostDbSet = mockDbSet(new List<post>());
            mockContext.Setup(m => m.posts).Returns(mockPostDbSet.Object);

            var mockClient = new Mock<ICommunityClient>();

            var pageList = new List<facebook_page>();
            for (int i = 0; i < 3; ++i)
            {
                var testPosts = makePosts(i, 2);
                mockClient.Setup(m => m.GetPosts("https://facebook.com/page" + i, "page" + i + "@example.com", i, Int32.MaxValue))
                    .Returns(testPosts);
                pageList.Add(makePage(i));
            }

            var mockPageDbSet = mockDbSet(pageList);
            mockContext.Setup(m => m.facebook_page).Returns(mockPageDbSet.Object);

            Utils.SyncPosts(mockClient.Object, mockContext.Object, Utils.SYNC_ALL_PAGES);

            mockPostDbSet.Verify(m => m.Add(It.IsAny<post>()), Times.Exactly(6));
        }

        [TestMethod]
        public void TestSyncPosts_Filter()
        {
            var mockContext = new Mock<Social_PresenceEntities>();

            var mockPageDbSet = mockDbSet(new List<facebook_page>() { makePage(1) });
            mockContext.Setup(m => m.facebook_page).Returns(mockPageDbSet.Object);

            var mockClient = new Mock<ICommunityClient>();

            var testPosts = makePosts(1, 1);
            mockClient.Setup(m => m.GetPosts("https://facebook.com/page1", "page1@example.com", 1, Int32.MaxValue))
                .Returns(testPosts);
            Utils.SyncPosts(mockClient.Object, mockContext.Object, (a, b) => false);

            mockClient.Verify(m => m.GetPosts("https://facebook.com/page1", "page1@example.com", 1, Int32.MaxValue), Times.Never);
        }

        private facebook_page makePage(int id)
        {
            facebook_page page = new facebook_page();
            page.id = id;
            page.url = "https://facebook.com/page" + id;
            page.contributor_email = String.Format("page{0}@example.com", id);
            return page;
        }

        private List<post> makePosts(int pageId, int postPerPage)
        {
            var page1Posts = new List<post>();
            for (int i = 0; i < postPerPage; ++i)
            {
                page1Posts.Add(makePost(pageId));
            }
            return page1Posts;
        }

        private post makePost(int page)
        {
            post p = new post();
            p.title = "page" + page + " title";
            return p;
        }

        private Mock<DbSet<T>> mockDbSet<T>(List<T> input) where T : class
        {
            var data = input.AsQueryable();
            var mockSet = new Mock<DbSet<T>>();
            mockSet.As<IQueryable<T>>().Setup(m => m.Provider).Returns(data.Provider);
            mockSet.As<IQueryable<T>>().Setup(m => m.Expression).Returns(data.Expression);
            mockSet.As<IQueryable<T>>().Setup(m => m.ElementType).Returns(data.ElementType);
            mockSet.As<IQueryable<T>>().Setup(m => m.GetEnumerator()).Returns(() => data.GetEnumerator());
            //mockSet.As<IEnumerable<T>>().Setup(m => m.GetEnumerator()).Returns(() => data.GetEnumerator());

            return mockSet;
        }
    }
}
