print("Escribe 'salir' para salir del programa")

while True:
        texto = input("Escribe el texto: ")
        if texto.lower() == "salir":
            print("Programa terminado")
            break
        else:
            print(f"Eco: {texto}")