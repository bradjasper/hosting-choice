import unittest
from catalog import models
from django.contrib.auth import models as auth

class CatalogTest(unittest.TestCase):

    def testKarma(self):
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
            karma.delete()
            karma2.delete()
            karma3.delete()
            comment.delete()


    def testRatingLimit(self):
        """Test the rating limit"""

        comment = models.Comment.objects.all()[0]
        type = models.RatingType.objects.all()[0]
        val = type.limit + 10
        rating = models.Rating(comment=comment, type=type, value=val)
        rating.save()
        assert rating.value == type.limit
        rating.delete()


    def testCommentRating(self):
        """Test individual comment rating"""

        host = models.Host.objects.all()[0]


        comment = models.Comment(text='test', host=host)
        comment.save()

        types = models.RatingType.objects.all()

        items = []
        for value, type in zip([3, 4, 5], types):
            tmp_obj = models.Rating(comment=comment, type=type, value=value)
            tmp_obj.save()
            items.append(tmp_obj)

        assert comment.rating() == 4.0, comment.rating()

        for tmp_obj in items:
            tmp_obj.delete()

        items = []
        for value, type in zip([3, 3], types):
            tmp_obj = models.Rating(comment=comment, type=type, value=value)
            tmp_obj.save()
            items.append(tmp_obj)

        assert comment.rating() == 3.0, comment.rating()

        for tmp_obj in items:
            tmp_obj.delete()

        comment.delete()


    def testHostRating(self):
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

            assert comment.rating() == 4.0, comment.rating()

            comment2 = models.Comment(text='test', host=host)
            comment2.save()

            for value, type in zip([3, 3, 3], types):
                tmp_obj = models.Rating(comment=comment2, type=type, value=value)
                tmp_obj.save()
                items.append(tmp_obj)

            assert comment2.rating() == 3.0, comment2.rating()

            assert host.rating() == 3.5, host.rating()

        finally:

            try:
                for tmp_obj in items:
                    tmp_obj.delete()

                comment.delete()
                comment2.delete()
                host.delete()
            except:
                pass


    def testRatingCategories(self):
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

            assert comment.rating() == 4.0, comment.rating()

            comment2 = models.Comment(text='test', host=host)
            comment2.save()

            for value, type in zip([3, 3, 3], types):
                tmp_obj = models.Rating(comment=comment2, type=type, value=value)
                tmp_obj.save()
                items.append(tmp_obj)

            assert comment2.rating() == 3.0, comment2.rating()

            assert host.rating() == 3.5, host.rating()


            ratings = host.ratings()
            assert ratings['Support'] == 4.0
            assert ratings['Features'] == 3.0
            assert ratings['Uptime'] == 3.5

        finally:
            try:
                for tmp_obj in items:
                    tmp_obj.delete()
     
                comment.delete()
                comment2.delete()
                host.delete()
            except:
                pass




unittest.main()
