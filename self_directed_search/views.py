# coding:utf-8
from django.shortcuts import render_to_response
from self_directed_search.models import Questions, Result
from django.http.response import HttpResponse

def allQuestions(request):
    questions = Questions.objects.all()
    return render_to_response('questionList.html', {'questions':questions})

def questionMatch(request):
    count=1
    gradeSum=[0 for x in range(6)]#建立大小为6的数组用于存储六种类型题目之和，初始为空
    for i in range(6):
        for j in range(10):
            if str(count) in request.GET:#根据name来获取每个题目的得分
                temp=int(request.GET[str(count)])
                gradeSum[i]+=temp
                count+=1
            else:
                message = '有未完成的选题~~'
                return HttpResponse(message)
    answers=Result.objects.all()
    #重新拼接字段，添加gradeSum字段
    answer_list = []
    count=0
    for file in answers:
        file_info = {}
        file_info['type'] = file.type
        file_info['common_features'] = file.common_features
        file_info['typical_career'] = file.typical_career
        file_info['gradeSum'] = gradeSum[count]
        answer_list.append(file_info)
        count+=1
    #对结果按照 “gradeSum” 字段按降序排列
    answer_list.sort(key=lambda x:x["gradeSum"],reverse=True) 
    return render_to_response('answerList.html', {'answer_list':answer_list})