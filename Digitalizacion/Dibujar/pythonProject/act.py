from tkinter import *
canvas =Canvas(width=640,height=480,bg="white")
canvas.pack(expand=YES,fill=BOTH)
for i in range(0,10):
    
    canvas.create_oval(200,200,400,400,fill="red")
mainloop()