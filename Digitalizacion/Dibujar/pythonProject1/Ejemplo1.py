from tkinter import *


canvas=Canvas(width=640,height=480,bg="white")
canvas.pack(expand=YES,fill=BOTH)
canvas.create_line(0,0,320,200,fill="green")
mainloop()