from tkinter import *

canvas =Canvas(width=640,height=480,bg="white");
canvas.pack(expand=YES,fill=BOTH)
canvas.create_oval(200,200,400,400,fill="blue")
mainloop()