from tkinter import *
canvas =Canvas(width=640,height=480,bg="white")
canvas.pack(expand=YES,fill=BOTH)
puntos=[20,200,100,0,200,200]
canvas.create_polygon(puntos,outline="yellow",fill="blue")
mainloop()