import unittest
from catalog import models
from django.contrib.auth import models as auth

def create_comment(host, ratings):
    """Helper function for creating comments"""
    comment2 = models.Comment(text='test', host=host)
    comment2.save()

    types = models.RatingType.objects.all()

    items = []
    for value, type in zip(ratings, types):
        tmp_obj = models.Rating(comment=comment2, type=type, value=value)
        tmp_obj.save()
        items.append(tmp_obj)

    return items

class CatalogTest(unittest.TestCase):

    def _testKarma(self):
        """Test karma"""

        try:
            host = models.Host.objects.all()[0]
            comment = models.Comment(text='test', host=host)
            comment.save()

            karma = models.Karma(comment=comment, value=2, ip='2345')
            karma.save()

            assert karma.value == 2
            assert comment.karma() == 2, comment.karma()


            karma2 = models.Karma(comment=comment, value=5, ip='234')
            karma2.save()

            assert comment.karma() == 7, comment.karma()

            karma3 = models.Karma(comment=comment, value=-10, ip='102')
            karma3.save()

            assert comment.karma() == -3, comment.karma()

            
        except:
            raise
        finally:
            try:
                karma.delete()
                karma2.delete()
                karma3.delete()
                comment.delete()
            except UnboundLocalError:
                pass


    def _testRatingLimit(self):
        """Test the rating limit"""

        comment = models.Comment.objects.all()[0]
        type = models.RatingType.objects.all()[0]
        try:
            val = type.limit + 10
            rating = models.Rating(comment=comment, type=type, value=val)
            rating.save()
            assert rating.value == type.limit
        finally:
            rating.delete()


    def _testCommentRating(self):
        """Test individual comment rating"""

        try:
            host = models.Host.objects.all()[0]

            comment = models.Comment(text='test', host=host)
            comment.save()

            types = models.RatingType.objects.all()

            items = []
            for value, type in zip([3, 4, 5], types):
                tmp_obj = models.Rating(comment=comment, type=type, value=value)
                tmp_obj.save()
                items.append(tmp_obj)

            assert comment.rating() - 4.0 < .0001, comment.rating()

            for tmp_obj in items:
                tmp_obj.delete()

            items = []
            for value, type in zip([3, 3], types):
                tmp_obj = models.Rating(comment=comment, type=type, value=value)
                tmp_obj.save()
                items.append(tmp_obj)

            assert comment.rating() == 3.0, comment.rating()

        finally:
            for tmp_obj in items:
                tmp_obj.delete()

            comment.delete()


    def _testHostRating(self):
        """Test individual host rating"""

        try:
            user = auth.User.objects.all()[0]
            category = models.Category.objects.all()[0]
            host = models.Host(user=user, category=category,
                url='http://blah.com')
            host.save()

            comment = models.Comment(text='test', host=host)
            comment.save()

            types = models.RatingType.objects.all()

            items = []
            for value, type in zip([3, 4, 5], types):
                tmp_obj = models.Rating(comment=comment, type=type, value=value)
                tmp_obj.save()
                items.append(tmp_obj)

            assert comment.rating() - 4 < .0001, comment.rating()

            comment2 = models.Comment(text='test', host=host)
            comment2.save()

            for value, type in zip([3, 3, 3], types):
                tmp_obj = models.Rating(comment=comment2, type=type, value=value)
                tmp_obj.save()
                items.append(tmp_obj)

            assert comment2.rating() - 3.0 < .0001, comment2.rating()

            assert host.rating() == 3.5, host.rating()

            assert host.rating(100) == 70, host.rating(100)

        finally:

            try:
                for tmp_obj in items:
                    tmp_obj.delete()

                comment.delete()
                comment2.delete()
                host.delete()
            except:
                pass


    def _testRatingCategories(self):
        """Test the different rating categories"""


        try:
            user = auth.User.objects.all()[0]
            category = models.Category.objects.all()[0]
            host = models.Host(user=user, category=category,
                url='http://blah.com')
            host.save()

            comment = models.Comment(text='test', host=host)
            comment.save()

            types = models.RatingType.objects.all()

            items = []
            for value, type in zip([3, 4, 5], types):
                tmp_obj = models.Rating(comment=comment, type=type, value=value)
                tmp_obj.save()
                items.append(tmp_obj)

            assert comment.rating() - 4.0 < .0001, comment.rating()

            comment2 = models.Comment(text='test', host=host)
            comment2.save()

            for value, type in zip([3, 3, 3], types):
                tmp_obj = models.Rating(comment=comment2, type=type, value=value)
                tmp_obj.save()
                items.append(tmp_obj)

            assert comment2.rating() - 3.0 < .0001, comment2.rating()

            assert host.rating() == 3.5, host.rating()

            ratings = host.ratings()
            assert ratings['Support'] == 3.5, ratings
            assert ratings['Features'] == 3.0
            assert ratings['Uptime'] == 4.0

        finally:
            try:
                for tmp_obj in items:
                    tmp_obj.delete()
     
                comment.delete()
                comment2.delete()
                host.delete()
            except:
                pass



    def testHostLeaderboard(self):
        """Test the host leaderboard. This assigns a rank to every
        host in the system using their overall rating"""

        try:

            hosts = models.Host.objects.leaderboard()
            host1, host2 = hosts[0], hosts[1]

            comments = []

            for x in xrange(2):
                comments.extend(create_comment(host2, [5, 5, 5]))

            # Verify host2 is now in the #1 position
            hosts = models.Host.objects.leaderboard()
            assert host2 == hosts[0], (host2, hosts[0])


            assert host2.rank() == 1, host2.rank()


        finally:

            try:
                for comment in comments:
                    comment.delete()
            except UnboundLocalError:
                pass



unittest.main()
