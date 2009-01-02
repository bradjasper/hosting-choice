import unittest
from catalog import models
from django.contrib.auth import models as auth

class CatalogTest(unittest.TestCase):

    def testKarma(self):
        """Test karma"""

        try:
            entry = models.Entry.objects.all()[0]
            comment = models.Comment(text='test', entry=entry)
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

        entry = models.Entry.objects.all()[0]


        comment = models.Comment(text='test', entry=entry)
        comment.save()

        types = models.RatingType.objects.all()

        items = []
        for value, type in zip([3, 4, 5], types):
            tmp_obj = models.Rating(comment=comment, type=type, value=value)
            tmp_obj.save()
            items.append(tmp_obj)

        assert comment.rating() == 0.8, comment.rating()

        for tmp_obj in items:
            tmp_obj.delete()

        items = []
        for value, type in zip([3, 3], types):
            tmp_obj = models.Rating(comment=comment, type=type, value=value)
            tmp_obj.save()
            items.append(tmp_obj)

        assert comment.rating() == 0.6, comment.rating()

        for tmp_obj in items:
            tmp_obj.delete()

        comment.delete()


    def testEntryRating(self):
        """Test individual entry rating"""

        user = auth.User.objects.all()[0]
        category = models.Category.objects.all()[0]
        entry = models.Entry(user=user, category=category,
            url='http://blah.com')
        entry.save()

        comment = models.Comment(text='test', entry=entry)
        comment.save()

        types = models.RatingType.objects.all()

        items = []
        for value, type in zip([3, 4, 5], types):
            tmp_obj = models.Rating(comment=comment, type=type, value=value)
            tmp_obj.save()
            items.append(tmp_obj)

        assert comment.rating() == 0.8, comment.rating()

        comment2 = models.Comment(text='test', entry=entry)
        comment2.save()

        for value, type in zip([3, 3, 3], types):
            tmp_obj = models.Rating(comment=comment2, type=type, value=value)
            tmp_obj.save()
            items.append(tmp_obj)

        assert comment2.rating() == 0.6, comment2.rating()

        assert entry.rating() == 0.7, entry.rating()

        for tmp_obj in items:
            tmp_obj.delete()

        comment.delete()
        comment2.delete()
        entry.delete()





unittest.main()
