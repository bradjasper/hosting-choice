import unittest
import spyder

class SpyderTest(unittest.TestCase):

    def testSpyderCrawl(self):
        """Test retrieving content"""
        bot = spyder.Spyder('http://localhost:8000/spyder/?show_link=True')
        assert len(bot.content)

    def testFindLink(self):
        """Test finding a link with a specific id"""
        bot = spyder.Spyder('http://localhost:8000/spyder/?show_link=True')
        link = bot.find_link('bizdir')
        assert link
        assert not bot.find_link('test')

        assert link.href == 'http://www.bizdir.com', link.href
        assert unicode(link) == 'BizDir'
        assert link.localName == 'a', link.localName

        bot2 = spyder.Spyder('http://localhost:8000/spyder/?show_link=False')
        assert not bot2.find_link('bizdir')

unittest.main()

