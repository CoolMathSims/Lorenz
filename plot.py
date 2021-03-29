#from https://jakevdp.github.io/blog/2013/02/16/animating-the-lorentz-system-in-3d/
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import animation
from matplotlib.colors import cnames
import os
from matplotlib.animation import PillowWriter

data = np.loadtxt('coord1.dat')
data2 = np.loadtxt('coord2.dat')

points = np.asarray([data,data2])
xdata = data[:,0]
ydata = data[:,1]
zdata = data[:,2]

x2data = data2[:,0]
y2data = data2[:,1]
z2data = data2[:,2]


fig = plt.figure()

ax = fig.add_axes([0, 0, 1, 1], projection='3d')
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z')
ax.set_xlim((min(xdata), max(xdata)))
ax.set_ylim((min(ydata), max(ydata)))
ax.set_zlim((min(zdata), max(zdata)))

ax.set_title("Euler")


colors = plt.cm.jet(np.linspace(0, 1, 2))

lines = sum([ax.plot([], [], [], '-', c=c)
             for c in colors], [])

pts = sum([ax.plot([], [], [], 'o', c=c)
           for c in colors], [])




def init():
    for line, pt in zip(lines, pts):
        line.set_data([], [],)
        line.set_3d_properties([])

        pt.set_data([], [])
        pt.set_3d_properties([])
    return lines + pts

def animate(i):
    i = i % points.shape[1]
    for line, pt, p in zip(lines,pts,points):
        x,y,z = p[:i].T

        line.set_data(x, y)
        line.set_3d_properties(z)

        pt.set_data(x[-1:], y[-1:])
        pt.set_3d_properties(z[-1:])

    ax.view_init(30, 0.3 * i)
    fig.canvas.draw()
    return lines + pts


anim = animation.FuncAnimation(fig, animate, init_func=init,
                              frames=len(points[1]), interval=30, blit=False)

# Save
writer = PillowWriter(fps=100)
#anim.save('lorenz_attractorE.gif', writer = writer)
plt.show()
