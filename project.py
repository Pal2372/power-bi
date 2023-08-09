#pyttsx3 library for text to speech
#Q.1
'''
from tkinter import *
root=Tk()
root.title("Leap year")
root.geometry("800x900")

year=Label(root,text="Enter a Year: ")
year.pack()

inp=Entry(root)
inp.pack()

def show():
    v.delete("0.0",END)
    a=int(inp.get())
    if (a % 4 == 0 and (a %400 == 0 or a % 100 != 0)):
        v.insert("0.0", str(a)+" is a leap year")
    else:
        v.insert("0.0", str(a)+" is not a leap year")


    

b=Button(root,text="click",command=show)
b.pack()

v=Text(bg="yellow")
v.pack()

root.mainloop()
'''
#Q.2
'''
from tkinter import *
import pyttsx3
root=Tk()
root.title("text to speech")
root.geometry("500x800")

def talk():
    #my_entry.delete(0.0,END)
    engine=pyttsx3.init()
    engine.say(my_entry.get())
    rate = engine.getProperty('rate') 
    engine.setProperty("rate",100)
    voices = engine.getProperty('voices')
    engine.setProperty("voice",voices[1].id)
    engine.runAndWait()
    engine.stop()
    

my_entry = Entry(root, font=("Helvetica",28))
my_entry.pack(pady=20)

my_button=Button(root,text="Speak",command=talk)
my_button.pack(pady=20)

root.mainloop()
'''
#Q.3

from tkinter import *

root=Tk()
root.title("Currency Converter")
root.geometry("1000x1000")
root.config(bg="grey20")

currency_label=Label(root,text="Currency Converter",font=("times new roman","60","bold"),bg="grey20",fg="red")
currency_label.grid(pady=10)

lbl1 = Label(root,text="From:",font=("times new roman","40","bold"),bg="grey20",fg="#ADD8E6")
lbl1.grid(pady=5)

inp1 = Entry(root,width=24,bd=2)
inp1.grid(pady=5)

lbl2=Label(root,text="To:",font=("times new roman","40","bold"),bg="grey20",fg="#ffb6c1")
lbl2.grid(pady=5)

inp2= Entry(root,width=24,bd=2)
inp2.grid(pady=15)

lbl3=Label(root,text="Amount:",font=("times new roman","40","bold"),bg="grey20",fg="#FFD580")
lbl3.grid(pady=5)

inp3=Entry(root,width=24,bd=2)
inp3.grid()

def convert():
    import json
    import requests
    txt.delete("0.0", END)
    
    s = inp1.get()
    h = inp2.get()
    d = float(inp3.get())

    url = "https://api.exchangerate-api.com/v4/latest/" + s.upper()

    a = requests.get(url)
    b = a.text
    c = json.loads(b)
    r = d * c["rates"][str(h.upper())]

    txt.insert("0.0", r)
    
button = Button(root, text = "Convert",font=("times new roman","20","bold"), command = convert)
button.grid(pady=5)

lbl3 = Label(root,justify="center", text = "Converted",font=("times new roman","20","bold"))
lbl3.grid(pady=5)

txt = Text(root, width = 20, height = 2)
txt.grid()


root.mainloop()


