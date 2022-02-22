from django.test import TestCase
from myapp import models


class TestModels(TestCase):
    def test_populate_test_model(self):
        models.Test.objects.create(name="test")
        assert models.Test.objects.filter(name="test").exists()
