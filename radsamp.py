#! /usr/bin/env python

import numpy as np
import matplotlib.pyplot as plot
import math
from sklearn.utils import shuffle

# length = np.sqrt(np.random.uniform(0, 1, 1000))
# angle = np.pi * np.random.uniform(0, 2, 1000)
# x = length * np.cos(angle)
# y = length * np.sin(angle)

a   = np.exp(np.random.uniform(np.log(2000),np.log(10),99500))
a   = a*(-1)
b   = (np.random.uniform(-10,10,1000))
c   = np.append(a,b)
d   = np.exp(np.random.uniform(np.log(10),np.log(2000),99500))
M1  = shuffle(np.append(c,d))

e   = (np.random.uniform(0,10,1000))
f   = np.exp(np.random.uniform(np.log(10),np.log(2000),199000))
M2  = shuffle(np.append(e,f))

g   = np.exp(np.random.uniform(np.log(2000),np.log(10),99500))
g   = g*(-1)
h   = (np.random.uniform(-10,10,1000))
i   = np.append(g,h)
j   = np.exp(np.random.uniform(np.log(10),np.log(2000),99500))
Mu   = shuffle(np.append(i,j))
TanB = shuffle(np.random.uniform(1,70,200000))

data = np.array([M1,M2,Mu,TanB])
data = data.T
np.savetxt("pts_out.dat", data,  delimiter=' ', fmt='%1.18e')
