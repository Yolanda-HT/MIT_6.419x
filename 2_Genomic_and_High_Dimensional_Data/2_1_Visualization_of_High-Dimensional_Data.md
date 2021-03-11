## Objectives

At the end of this lecture, you should be able to:

- Recognize the different features of the three dimension reduction techniques: principal component analysis (PCA), multi-dimensional scaling (MDS), and stochastic neighbor embedding (SNE) .

- Implement the PCA and the classical- MDS algorithms using elementary linear algebra.

- Decide between using covariance and correlation for the dimension reduction analysis.

- Explore how to use explained variance to choose the number of dimensions of the projection.

- Describe Stochastic Neighbor Embedding (SNE) and t-distributed Stochastic Neighbor Embedding (t-SNE) as minimization of the Kullback-Leibler divergence (KL-divergence) between the probability distributions on data pairs in both the original high-dimensional and the target low-dimensional space.

- Recognize that t-SNE alleviates crowding of data points in low-dimension.

- Analyze the results of PCA, MDS, t-SNE together to identify patterns of the data.

## Introduction
[Wikipedia - Singular value decomposition](https://en.wikipedia.org/wiki/Singular_value_decomposition)
[Wikipedia - MDS](https://en.wikipedia.org/wiki/Multidimensional_scaling)


Dimension reduction refers to a set of techniques which can transform high-dimensional data into their representative low-dimensional data. During the process, some information of the original data is discarded but some main characteristics of the original data is preserved.

Dimension reduction is important because processing and analyzing high-dimensional data can be computationally intractable. Dimension reduction is very useful in dealing with a large number of observations and variables, hence it is widely used in many fields such as signal processing, machine learning, and bioinformatics.

Three dimension reduction techniques will be introduced:

- Principal Component Analysis (PCA)

- Multidimensional Scaling (MDS), and

- Stochastic Neighbor Embedding (SNE).

**PCA** tries to project the original high-dimensional data into lower dimensions by capturing the most prominent variance in the data.

**MDS** is a technique for reducing data dimensions while attempting to preserve the relative distance between high-dimensional data points.

**SNE** is a non-linear technique to “cluster" data points by trying to keep similar data points close to each other.

PCA and classical MDS share similar computations: they both use the spectral decomposition of symmetric, but on different input matrices.

You will think through some of the mathematics in this lecture. For demonstration of implementations, see the recitation at the end of this module.