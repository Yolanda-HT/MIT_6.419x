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

## Principal Component Analysis (PCA)


**Principal component analysis (PCA)** is often used to find a low dimensional representation of data that maximizes the spread of the projected data.

The **first principal component ( PC1 )** is the direction of the largest variance of the data. The **second principal component  PC2 )** is perpendicular to the first principal component and is the direction of the largest variance of the data among all directions that are perpendicular to the first principal component. The **third principal component ( PC3 )** is perpendicular to both first and second principal components and is in the direction of the largest variance among all directions that are perpendicular to both the first and second principal components. This can continue until we obtain as many principal components as the dimension of the original space in which the data is given, i.e. an orthogonal basis of the data space consisting of principal components. However, we are generally interested in the fewer dimensions as the original space, for example, 2 or 3 dimensions for visualization, or few than 100 dimensions out of thousands of dimensions of the original space, as you will see in the recitation and the analysis at the end of this module.

Principal component analysis can be formulated in the following three equivalent ways. For simpliciy, we will only formulate the problem for the first principal component  PC1 .

Let  𝐱(1),𝐱(2),𝐱(𝑛)∈ℝ𝑝  denote the  𝑛  data points in  𝑝  dimensional space. The first principal component is the line spanned by a unit vector  𝐰∈ℝ𝑝  such that

- 𝐰  minimizes the sum of squared residuals of the orthogonal projections of data  𝐱(𝑖)  onto  𝐰 :

 	 min𝐰∈ℝ𝑝∑𝑖=1𝑛‖‖𝐱(𝑖)−(𝐱(𝑖)⋅𝐰)𝐰‖‖2 	 	 
- 𝐰  maximizes the sum of squared norms of the orthogonal projections of data  𝐱(𝑖)  onto  𝐰 :

 	 max𝐰∈ℝ𝑝∑𝑖=1𝑛‖‖(𝐱(𝑖)⋅𝐰)‖‖2 	 

- 𝐰  is an eigenvector corresponding to the largest eigenvalue of the the sample covariance matrix  𝐒 :

 	 𝐒 	 = 	 1𝑛−1𝕏𝑇𝕏where 𝕏=⎛⎝⎜⎜⎜⎜⎜←←←(𝐱(1))𝑇(𝐱(2))𝑇⋮(𝐱(𝑛))𝑇→→→⎞⎠⎟⎟⎟⎟⎟. 	 	 

**Remark:** Note that the sample covariance matrix has different definitions (dividing by  𝑛  or  𝑛−1 , but the eigenvectors and the order of the eigenvalues are not affected by this overall rescaling. Hence, if our goal is only to find the principal components, we are free to choose any scalar multiple of sample covariance matrix, e.g.  𝕏𝑇𝕏 .

## Correlation matrix
Recall that the correlation  𝜌𝑋,𝑌  of two random variables  𝑋  and  𝑌  is the covariance of the the rescaled random variables  𝑋𝜎𝑋 , and  𝑌𝜎𝑌 :

 	 𝜌𝑋,𝑌 	 = 	 𝖢𝗈𝗏(𝑋𝜎𝑋,𝑌𝜎𝑌)=𝖢𝗈𝗏(𝑋,𝑌)𝜎𝑋𝜎𝑌=𝐄[𝑋𝑌]−𝐄[𝑋]𝐄[𝑌](𝐄[𝑋2]−(𝐄[𝑋])2)(𝐄[𝑌2]−(𝐄[𝑌])2)‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾√. 	 	 
If  𝐄[𝑋]=𝐄[𝑌]=0 , then

 	 𝜌𝑋,𝑌 	 = 	 𝐄[𝑋𝑌]𝐄[𝑋2]𝐄[𝑌2]‾‾‾‾‾‾‾‾‾‾‾‾‾√. 	 	 
Extending to random vectors  𝐗  with  𝐄[𝐗]=0 , the correlation matrix is the covariance matrix of rescaled data  𝐗̃ 𝑇=(𝑋1/𝜎1𝑋2/𝜎2⋯𝑋𝑛/𝜎𝑛)𝑇 :

 	 𝐄[𝐗̃ 𝐗̃ 𝑇]=𝐄⎡⎣⎢⎢⎢⎢⎛⎝⎜⎜⎜⎜𝑋1/𝜎1𝑋2/𝜎2⋮𝑋𝑛/𝜎𝑛⎞⎠⎟⎟⎟⎟(𝑋1/𝜎1𝑋2/𝜎2⋯𝑋𝑛/𝜎𝑛)⎤⎦⎥⎥⎥⎥ 	 	 
so that  𝑖,𝑗 -th entry of the correlation matrix is  𝐄[𝐗𝑖𝜎𝑖𝐗𝑗𝜎𝑗] .

By definition, covariance has the dimension of squared of the data  𝑥2 , while correlation is dimensionless. Hence, when covariates have different dimensions or units, it makes more sense to first rescale each covariate by its sample standard deviation, before determining the directions of largest spread using PCA.

## Total variance
We can decide how many principal components to retain in the projection of the data based on their explained variance.

The total variance is the sum of variance of all the principal components, which equals the sum of the eigenvalues of the covariance matrix:

Total Variance:∑𝑗=1𝑝𝜆𝑗. 
 
The fraction of variance explained by a principal component is the ratio of the variance of that principal component to the total variance:

 	 𝜆𝑖∑𝑝𝑗=1𝜆𝑗 	 	 
Ungraded Exercise: Compare the explained variance of the first principal component when PCA is applied to the correlation matrix with when PCA is applied to the covariance matrix.

## MDS
The goal of multidimensional scaling (MDS) is to preserve the relative distance between high-dimensional vectors in a low-dimensional space (usually 2 or 3).

**Input of MDS**

This technique can operate without the original dataset  𝕏  ( 𝕏∈ℝ𝑛×𝑝 ). Instead, it can directly use the distance matrix  𝐃∈ℝ𝑛×𝑛 , where  𝐃𝑖𝑗  is the distance between  𝐱(𝑖)  and  𝐱(𝑗) .

**Output**

The objective is to find points  𝐲1,…,𝐲𝑛∈ℝ𝑞  such that an objective, for example

∑𝑖=1𝑛∑𝑗=1𝑛(𝐃𝑖𝑗−‖𝐲𝑖−𝐲𝑗‖2)2 
 
is minimized, where  𝐲𝑖  and  𝐲𝑗  are the projections of  𝐱𝑖  and  𝐱𝑗  in a low-dimensional space, respectively.

This objective requires the distance between two data points in the high-dimensional space to be similar to their distance in the low-dimensional space.

**Variation of objectives**

There are variations of MDS which use different objective functions. For example, weighted MDS uses the objective function  ∑𝑛𝑖=1∑𝑛𝑗=1𝑤𝑖𝑗(𝐃𝑖𝑗−‖𝐲𝑖−𝐲𝑗‖2)2 , where  𝑤𝑖𝑗  are non-negative weights.

*X is matrix consisting of row vectors x1, x2 ... xn*
*X @ X^T: the diagnol represent length of vector. [i,j] element represent angel (dot product)*


*Classical MDS is PCS on B = X@X^T; classical PCA operates on X^T@X*
*If sample size = n, feature size = p*
*Classical MDS operates on nxn matrix, while classical PCA operates on pxp matrix*

## Stochastic neighbor embedding (SNE)

Stochastic neighbor embedding (SNE) is a probabilistic approach to dimensional reduction that places data points in high dimensional space into low dimensional space while preserving the identity of neighbors. That is, SNE attempts to keep nearby data points nearby, and separated data points relatively far apart.

The idea of SNE is to define a probability distribution on pairs of data points in each of the original high dimensional space and the target low dimensional space, and then determine the placement of objects in low dimension by minimizing the “difference' of the two probability distributions.

More precisely:

1. Input: Distance matrix  𝐷𝑖𝑗  of data in a  𝑝 -dimensional space.

2. In high dimension: In the  𝑝  dimensional space, center a Gaussian distribution ( exp(−‖‖𝐱−𝐱(𝑖)‖‖2)  on each data point  𝐱(𝑖) . For each data point  𝐱(𝑖) , define the probability of another data point  𝐱(𝑗)  being its neighbor to be

 	 𝑝𝑖𝑗=exp(−𝐷2𝑖𝑗)∑𝑘≠𝑙exp(−𝐷2𝑙𝑘)where 𝐷2𝑖𝑗=‖‖𝐱(𝑖)−𝐱(𝑗)‖‖2,𝑖≠𝑗 	 	 
where the denominator sums over all distinct pairs of data points. Notice the symmetry  𝑝𝑖𝑗=𝑝𝑗𝑖 ; hence we can restrict to indices where  𝑖<𝑗 .

The set of all  𝑝𝑖𝑗  defines the pmf ofprobability distribution  𝐏  on all pairs of points in  𝑝 -dimensional space. The shape of the Gaussian distribution ensures that pairs that are close together are given much more weight than pairs that are far apart.

**Example 0:**

If a data set had only 2 data points  𝐱(1),𝐱(2)  at distance  𝑑  in  𝑝 -dimensional space, then using the definition above:

 	 𝑝𝑖𝑗=exp(−𝐷2𝑖𝑗)∑𝑘>𝑙exp(−𝐷2𝑙𝑘)where 𝑖<𝑗, 	 	 
we get

𝑝12=exp(−𝑑2)exp(−𝑑2)=1 
 
regardless of the distance  𝑑 , since there is only 1 pair of distinct data points.

3. In Low Dimensions: Do the same as above in  𝑞 -dimensional target space. That is, define for each point  𝐲(𝑖)  the probability of  𝐲(𝑗)  being its neighbor to be

 	 𝑞𝑖𝑗=exp(−‖‖𝐲(𝑖)−𝐲(𝑗)‖‖2)∑𝑘≠𝑙exp(−‖‖𝐲(𝑘)−𝐲(𝑙)‖‖2)(𝑖≠𝑗). 	 	 
The set of all  𝑞𝑖𝑗  define the pmf of a probability distribution  𝐐  on all pairs of points in the  𝑞 -dimensional target space.

4. Minimization: Find points  {𝐲(𝑖)}  in the  𝑞 -dimensional target space that minimizes the Kullback-Leibler (KL) divergence between the probability distributions  𝐏  and  𝐐 :

KL(𝐏||𝐐)=∑𝑖≠𝑗𝑝𝑖𝑗log𝑝𝑖𝑗𝑞𝑖𝑗 
 
where  𝑝𝑖𝑗  and  𝑞𝑖𝑗  give the pmfs of  𝐏  and  𝐐  respectively.

In practice, this minimization is implemented using gradient descent methods.

Remark: For simplicity, in the definitions of the distributions  𝐏  and  𝐐 , we have used Gaussian distributions with the same variance at each data point, and simplified the definition of  𝑝𝑖𝑗  and  𝑞𝑖𝑗 . Practical algorithms are more sophisticated: they use Gaussian distributions with different variances  𝜎2𝑖  at different data points, and then symmetrize between points  𝑖  and  𝑗  to get the pmf  𝑝𝑖𝑗 . (See for example Wikipedia page on T-SNE.) The different variances  𝜎2𝑖  are chosen to match with user-defined hyperparameters such as  perplexity . You will have a chance to explore the effect of some of this hyperparameters in the analysis of this unit.

### Kullback-Leibler (KL) divergence and Its Properties

Recall the definition and properties of the Kullback-Leibler (KL) divergence between discrete distributions from the course Fundamentals of Statistics (Lecture 8).

Definition of KL-Divergence

Let  𝐏  and  𝐐  be discrete probability distributions wtih common sample space and with pmfs  𝑝  and  𝑞  respectively. Then the KL-divergence (also known as relative entropy ) of  𝐏  from  𝐐  is defined as

KL(𝐏,𝐐)=∑𝑥∈𝐸𝑝(𝑥)ln(𝑝(𝑥)𝑞(𝑥)). 
 
Properties of KL-Divergence

While the KL-divergence is not technically a distance between 2 distributions, it satisfies two useful properties of distances

KL(𝐏,𝐐)≥0  (non-negative)

If  KL(𝐏,𝐐)=0 , then  𝐏=𝐐  (definiteness).

However, KL-divergence differs from a distance in the following ways:

KL(𝐏,𝐐)≠KL(𝐐,𝐏)  (assymmetry)

KL(𝐏,𝐐)≰KL(𝐏,𝐫)+KL(𝐫,𝐐)  (No triangle inequality).