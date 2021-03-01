## Objectives

In this lecture and series of exercises you will learn:

- The concepts of variance and covariance of data.

- What the correlation coefficient is and how it relates to covariance.

- How linear regression relates to correlation.

- How to transform data with non-linear relationship so that they may be analyzed with linear regression.

- The extension of linear regression to multiple dimensions.

- Application of the t-test to determine the significance of predictors in a multidimensional linear model.

After completing this lecture, you will be able to:

- Calculate the correlation coefficient for a 2D data set.

- Find the least squares solution for a multi-variate linear regression problem.

- Apply linear regression to non-linear relationships through variable transforms .

- Perform model selection on the predictors using a t-test.

As part of this lecture, you will be applying all of the above concepts to analyze real data in the context of astronomy. To do this, you will need a data analysis environment set up.

We recommend using Python, with the numpy and scipy packages. The data and solutions will be given in Python using these libraries. However, you are welcome to use any programming language or environment that you wish.

You will also be asked to visualize the data. In Python, you can do this with the matplotlib library.

For example, a scatter plot can be creating using

import matplotlib.pyplot as plt # import the library
plt.scatter(Xs, Ys) # Create the scatter plot, Xs and Ys are two numpy arrays of the same length
plt.show() # Display the plot you just created.
A line plot can be created using

```
plt.plot(Xs, Ys)
```

This will draw a line through the X, Y pairs defined by the Xs and Ys numpy arrays.

When working with matrices, numpy provides some convenient facilities. For example, to find the inverse of a matrix, use

```
import numpy as np
np.linalg.inv(matrix_to_invert)
The scipy package provides statistical distributions. For example, to calculate p-values for the t-distribution, you can use the survival function (sf):

import scipy.stats
scipy.stats.t.sf(T, num_degrees_of_freedom)
```

## Regression

In this unit we will

- Learn how to construct a linear predictive model.

- Learn how the solution to the least squares problem for the a linear predictive model relates to the correlation coefficient.

- Apply least squares optimization to the Hubble data.

- Learn how the correlation coefficient relates to the  𝑅2  goodness-of-fit metric.






