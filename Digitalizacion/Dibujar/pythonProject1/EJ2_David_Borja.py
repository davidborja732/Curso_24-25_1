from tkinter import *

canvas = Canvas(width=800, height=600, bg="white")
canvas.pack(expand=YES, fill=BOTH)
points = [100,250,300,170,500,250]
canvas.create_oval(200, 200, 400, 400, outline="black", fill="green")
canvas.create_polygon(points,fill="brown")
canvas.create_line(280,280,230,280)
canvas.create_line(320,290,370,280)
canvas.create_line(280,355,320,355)
canvas.create_text(300,100,text="David",fill="orange",font=("Arial",30))
mainloop()