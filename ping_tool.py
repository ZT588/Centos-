import IPy
import keyword
import threading
import subprocess
import time
import os
from queue import Queue
from tkinter import *
from pythonping import ping



#ips = IPy.IP("106.10.52.0/24")



global rp

rp =  open('C:\\Windows\\Temp\\ip_result.txt', 'w+')



threads= []
def ping_ip(i,output_q):
    global rp
    i =str(i)
    
    #result = os.system('ping -n 1 %s' %(i))  
    #result = subprocess.call('ping  -n 1 %s' %(i),stdout=subprocess.PIPE,shell=True)
    #if result == 0:
    #    print(i,'  is up',file=rp)
    #    rp.close
        
    
    #else:
    #   print(i,'is down!')

    result = ping (i)
    print(result)
    if 'Reply' in str(result):

        print(i,'  is up',file=rp)
    else:
        print(i,'is down!')


        





def ping_add():
    global rp
    start_time = (f"程序于 {time.strftime('%X')} 开始执行\n")
    ips = IPy.IP(entryx.get())  
    for i in ips:
     #i = i.strip()
         t = threading.Thread(target=ping_ip, args=(i, Queue()))
         t.start()
         threads.append(t)
    for y in threads:
        y.join()
    print(start_time)
    print (f"\n程序于 {time.strftime('%X')} 执行结束")
    text.insert(END,(start_time))
    text.insert(END,(f"\n程序于 {time.strftime('%X')} 执行结束\n"))

    rp =  open('C:\\Windows\\Temp\\ip_result.txt', 'w+')  

    for ip in rp.readlines():
        print(ip)
        text.insert('end',ip)
    
    
    



#rp =  open('C:\\Users\\cike5\\AppData\\Local\\Programs\\Python\\Python39\\Scripts\\todd\\ip_result.txt', 'w+')
    
#创建窗口
rview=Tk()
#标题
rview.title("IP_Tools_Todd")
#窗口大小 长高用小写x隔开
#rview.geometry("600x300")
#创建lab标签
labelx=Label(rview,text="批量ping",fg="blue",font=("宋体",20))
#显示lab标签 网格布局 sticky=W #左对齐 E为右对齐 默认为中间对齐
labelx.grid(row=0,column=0)


label1=Label(rview,text="2021v1.0",fg="blue",font=("宋体",20))
#显示lab标签 网格布局 sticky=W #左对齐 E为右对齐 默认为中间对齐
label1.grid(row=3,column=2)


#创建输入框默认显示
entext = StringVar()
#创建输入框
entryx=Entry(rview,font=("宋体",20),textvariable=entext)
#显示输入框
entryx.grid(row=0,column=1)
#创建按钮
buttonx=Button(rview,text="确定",font=("宋体",20),command= ping_add,)
#显示按钮
buttonx.grid(row=0,column=2)

scrollbar = Scrollbar(rview, orient=VERTICAL,bg="red")
scrollbar.grid(row=2,column=0)
text = Text(rview, width=50,height=20, yscrollcommand=scrollbar.set,font=("宋体",20))
text.grid(row=2,column=0)


#-------------------------------------------------
#设置内容
entext.set('192.168.31.0/24')
#插入内容，最开始处
#entryx.insert(0,'东')
#插入内容，光标位置开始
#entryx.insert(INSERT,'想')
#插入内容，末尾
#entryx.insert(END,'想')
#---------------------------------------------------


#消息循环 显示窗口
rview.mainloop()


    
