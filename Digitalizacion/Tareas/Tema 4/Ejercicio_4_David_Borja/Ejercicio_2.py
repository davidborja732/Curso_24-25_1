altura = int(input("Introduce altura para el triángulo: "))
for i in range(1, altura +1 ):
    num = 2 * i - 1
    fila = []
    for j in range(i):
        fila.append(str(num))
        num -= 2
    print(' '.join(fila))