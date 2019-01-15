import plotly.plotly as py
import plotly.graph_objs as go

# Create random data with numpy
import numpy as np

N = 1000
random_x = np.random.randn(N)
random_y = np.random.randn(N)

# Create a trace
trace = go.Scatter(
    x = random_x,
    y = random_y,
    mode = 'markers'
)

data = [trace]

# Plot and embed in ipython notebook!
#py.iplot(data, filename='basic-scatter')
layout=go.Layout(title='A Simple Plot', width=800, height=640)
fig=go.Figure(data=data, layout=layout)
py.image.save_as(fig, filename='plotlydemo.png')
# or plot with: plot_url = py.plot(data, filename='basic-line')
