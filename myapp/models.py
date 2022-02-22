import uuid
from django.db import models


class Test(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4)
    name = models.CharField(max_length=255)

    def __str__(self) -> str:
        return self.name
