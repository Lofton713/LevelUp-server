from django.db import models

class Event(models.Model):
    
    game = models.ForeignKey("Game", on_delete=models.CASCADE)
    description = models.CharField(max_length=100)
    date = models.DateField()
    time = models.TimeField()
    organizers = models.ForeignKey("Gamer", on_delete=models.CASCADE)
    attendees = models.ManyToManyField("Gamer", through="event_gamer", related_name="attending")
    
    
@property
def joined(self):
    return self.__joined

@joined.setter
def joined(self, value):
    self.__joined = value