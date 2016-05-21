using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using community;
using System.Collections.Generic;

namespace tests
{
    [TestClass]
    public class FacebookDataSourceTest
    {
        [TestMethod]
        public void TestGetPosts()
        {
            CommunityFbClient c = new CommunityFbClient();
            List<post> posts = c.GetPosts("https://www.facebook.com/ObshtinaBlagoevgrad", "system@example.com", 11);
            Console.WriteLine(String.Join("\n", posts));
            Assert.IsTrue(posts.Count > 5);
        }
    }
}
