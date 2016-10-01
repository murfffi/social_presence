using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using community;
using System.Collections.Generic;

namespace tests
{
    [TestClass]
    public class CommunityFbClientTest
    {
        [TestMethod]
        public void TestGetPosts()
        {
            CommunityFbClient c = new CommunityFbClient(100);
            List<post> posts = c.GetPosts("https://www.facebook.com/ObshtinaBlagoevgrad", "system@example.com", 11, 5, new HashSet<string>());
            Console.WriteLine(String.Join("\n", posts));
            Assert.AreEqual(5, posts.Count);
        }
    }
}
