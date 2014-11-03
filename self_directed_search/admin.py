#coding:utf-8
'''
Created on 2014年5月15日

@author: Administrator
'''
from django.contrib import admin
from self_directed_search.models import Questions,Result

admin.site.register(Questions)
admin.site.register(Result)