#FIND PHONE NUMBER DETAILS USING PYTHON (TRACK LOCATION)

'''
from tkinter import *
import phonenumbers as pn
from phonenumbers import geocoder, carrier

root=Tk()
root.geometry('500x400')
root.title("Phone Number")
lbl=Label(root,text="Enter your Phone no: ").pack()
en=Entry(root)
txt=Text(root,width=50)
def phone():
    b=pn.parse(en.get())
    Carrier = carrier.name_for_number(b, 'en')
    Geocoder = geocoder.description_for_number(b,'en')
    txt.delete('0.0',END)
    txt.insert("0.0"," Sim Name: "+Carrier)
    txt.insert("0.0","Sim Country: "+Geocoder)
    
btn=Button(root,text="Click",command=phone)
en.pack()
btn.pack()
txt.pack()
root.mainloop()

'''






