from django.db import models

class Result(models.Model):
    type = models.CharField(max_length=30)
    common_features = models.CharField(max_length=250)
    typical_career = models.CharField(max_length=100)     

class Questions(models.Model):
    type = models.CharField(max_length=30)
    content = models.CharField(max_length=100)
    name = models.CharField(max_length=20)
    
   
