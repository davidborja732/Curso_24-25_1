import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d.art3d import Poly3DCollection

# Define los vértices del cubo
vertices = np.array([
    [0, 0, 10],  # Vértice 0
    [0, 0, 0],  # Vértice 1
    [10, 10, 0],  # Vértice 2

])

# Define las caras del cubo mediante los índices de los vértices
faces = [
    [vertices[1], vertices[2], vertices[0], vertices[1]],  # Cara inferior
    [vertices[0], vertices[1], vertices[2], vertices[1]],  # Cara superior
    [vertices[2], vertices[0], vertices[1], vertices[2]],  # Cara lateral izquierda

]

# Crear la figura y el eje 3D
fig = plt.figure(figsize=(8, 8))
ax = fig.add_subplot(111, projection='3d')

# Añadir las caras del cubo al gráfico
poly3d = Poly3DCollection(faces, edgecolors='k', linewidths=1, alpha=0.5, facecolors='red')
ax.add_collection3d(poly3d)

# Ajustar los límites de los ejes
ax.set_xlim([0,10])
ax.set_ylim([10, 0])
ax.set_zlim([0, 10])

# Etiquetas y título
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_title('Cubo en 3D')

# Mostrar la gráfica
plt.show()