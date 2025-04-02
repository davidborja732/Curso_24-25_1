from tkinter import *
canvas = Canvas(width=800, height=600, bg="white")
canvas.pack(expand=YES, fill=BOTH)
x=150
y=100
for i in range(20):
    canvas.create_text(x,y,text="Hola",font=("20",),fill="red")
    x-=5
    y-=5
    canvas.create_text(x,y,text="Hola",font=("20",),fill="blue")
    canvas.mainloop();