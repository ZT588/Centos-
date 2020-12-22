from tkinter import *
import IPy

def butonck():
    ip = entryx.get()#输出输入框值
    #print(ip)
    ips = IPy.IP(entryx.get())
    #a = (ips.strNormal(3))
    text.insert(END,ips.strNormal(3) + "\n")
    text.insert(END,'IP 数量: %s' % len(ips) + "\n")
    text.insert(END,'IP Netmask:%s' % ips.netmask() + "\n" )
    text.insert(END,'IP prefix:%s' %ips.prefixlen() + "\n" )
    text.insert(END,'IP Network:%s' %ips.net() + "\n" )
    text.insert(END,'IP Broadcast:%s' %ips.broadcast() + "\n" )
    text.insert(END,'IP Type:%s' %ips.iptype() + "\n" )
    text.insert(END,ips.strBin() + "\n")
    #b = ('IP 数量: %s' % len(ips))
    
    #print('IP Netmask:%s' % ips.netmask())
    #print('IP prefix:%s' %ips.prefixlen())
    #print('IP Network:%s' %ips.net())
    #print('IP Broadcast:%s' %ips.broadcast())
    #print('IP Type:%s' %ips.iptype())
    #print(ips.strBin())
#创建窗口
rview=Tk()
#标题
rview.title("IP_Tools")
#窗口大小 长高用小写x隔开
#rview.geometry("600x300")
#创建lab标签
labelx=Label(rview,text="掩码计算",fg="blue",font=("宋体",20))
#显示lab标签 网格布局 sticky=W #左对齐 E为右对齐 默认为中间对齐
labelx.grid(row=0,column=0)
#创建输入框默认显示
entext = StringVar()
#创建输入框
entryx=Entry(rview,font=("宋体",20),textvariable=entext)
#显示输入框
entryx.grid(row=0,column=1)
#创建按钮
buttonx=Button(rview,text="确定",font=("宋体",20),command=butonck)
#显示按钮
buttonx.grid(row=0,column=2)

scrollbar = Scrollbar(rview, orient=VERTICAL,bg="red")
scrollbar.grid(row=2,column=0)
text = Text(rview, width=50,height=20, yscrollcommand=scrollbar.set,font=("宋体",10))
text.grid(row=2,column=0)

#-------------------------------------------------
#设置内容
entext.set('192.168.1.0/24')
#插入内容，最开始处
#entryx.insert(0,'东')
#插入内容，光标位置开始
#entryx.insert(INSERT,'想')
#插入内容，末尾
#entryx.insert(END,'想')
#--------------------------------------------------

#消息循环 显示窗口
rview.mainloop()
