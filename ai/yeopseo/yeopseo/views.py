from django.core.files.storage import FileSystemStorage  # 파일저장
from django.shortcuts import render, redirect
from .model import Post
from PIL import Image
from django.core.files.storage import default_storage
import asyncio
from rest_framework.response import Response
from django.http import HttpResponse


import numpy as np
from PIL import Image
import os
import glob
import sys
import numpy as np
import base64


# Create your views here.
def index(request):
    return render(request,'index.html')

def create(request, content):
    if request.method == "POST":
        if(default_storage.exists('image/sketch_img/0001.png')) :
            default_storage.delete('image/sketch_img/0001.png')
            
        print(request.FILES.keys())
        default_storage.save('image/sketch_img/0001.png', request.FILES["postcard"])
        print(request.FILES["postcard"])
        
    # image_label.py 실행
    os.chdir("/home/jupyter-j7e101/yeopseo/yeopseo/")
    os.system('python image_label.py')
    
    # sh파일 실행(SPADE폴더 들어가서 명령어 실행)
    os.chdir("/home/jupyter-j7e101/yeopseo/yeopseo/SPADE")
    os.system('python test.py --name coco_pretrained --dataset_mode coco --dataroot ../image/segmentation_img --results_dir ../image/real_img --gpu_ids -1')
    
    # neural_style_preserve_color.py 실행
    
    os.chdir("/home/jupyter-j7e101/yeopseo/yeopseo/")
    if content==1 :
        os.system('python neural_style_preserve_color1.py')
    elif content==2 :
        os.system('python neural_style_preserve_color2.py')
    elif content==3 :
        os.system('python neural_style_preserve_color3.py')
    elif content==4 :
        os.system('python neural_style_preserve_color4.py')
    elif content==5 :
        os.system('python neural_style_preserve_color5.py')    
    
    # response out333.png
    with open('/home/jupyter-j7e101/yeopseo/yeopseo/out333.png', "rb") as f:
      return HttpResponse(base64.b64encode(f.read()).decode('utf-8'))