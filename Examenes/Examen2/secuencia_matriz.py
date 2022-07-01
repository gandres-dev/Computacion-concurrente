#import matplotlib.pyplot as plt 
import numpy as np
import time

A = np.random.randint(0, 30, size=(10000,10000))
B = np.random.randint(0,30, size= (10000,10000))


def multiplicacion_matricial_secuencial(A, B):
    new_m = np.dot(A,B)
    return new_m    
    
    
t = time.time()
new_m=multiplicacion_matricial_secuencial(A, B)
print(new_m)
tiempo_secuencial = time.time()-t
print('Tiempo secuencial:', tiempo_secuencial)
