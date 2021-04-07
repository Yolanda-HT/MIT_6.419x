## Objectives

In this lecture, we will

- Describe the use and purpose of Steiner trees .

- Learn how to construct an approximate Steiner tree solution.

- Introduce the notion of clustering .

- Introduce graph Laplacian matrix.

- Conceptualize mathematically an ideal version of clustering as an optimization problem.

- Relax the ideal clustering problem to obtain a computationally tractable problem.

- Understand the importance of eigenvalues and eigenvectors of the graph Laplacian and learn spectral clustering .

- Introduce modularity maximization for the purpose of clustering.

## Motivation

*[Minimum spanning tree](https://en.wikipedia.org/wiki/Minimum_spanning_tree)*
*[Steiner tree](https://en.wikipedia.org/wiki/Steiner_tree_problem)*
*[NP completeness](https://en.wikipedia.org/wiki/NP-completeness)*


## Steiner trees

When examining a network, we may have identified a few nodes of particular interest. We may then want to ask the question: what is the smallest sub-network that connects all of these interest nodes? If we define “smallest" to mean the sum of all edge weights in the sub-network, then the this problem is known as the Steiner tree problem in graphs.

For example, we may have a weighted graph where each node is a city, and the weighted edges represent the costs to build an electrical distribution line between the connected cities. If the goal is to connect all cities on the graph while minimizing costs, then we should find the minimum spanning tree of the graph — which can be done in polynomial time.

However, suppose the goal is instead to connect just a few nodes of this graph together at minimum cost, perhaps due to a mandate or government contract. Then, the problem is the Steiner tree problem, and the computational complexity for finding the solution is NP-hard.

The cities that must be connected are called the terminals of the graph. The difficulty of the problem comes from the need to decide which additional cities should be used to create the subgraph that connects these terminals. If the mandate specified a few cities, and required that no other cities should be connected, then we could just discard the remaining nodes from the graph and the problem reduces to the minimum spanning tree.

*[P, NP, NP complete, NP hard](https://cs.stackexchange.com/questions/9556/what-is-the-definition-of-p-np-np-complete-and-np-hard)*

## Community Detection, Clustering, Modularity Maximization, Louvain Method


**Graph Laplacian**

We now introduce the graph Laplacian matrix of a graph. Throughout the remainder of this lecture, we assume only that the graph is simple and undirected. Everything discussed here also works for undirected, weighted, simple graphs.

The graph Laplacian matrix 𝐿 is defined as

 	𝐿=𝐷−𝐴,	 	 
where 𝐴 is the adjacency matrix and 𝐷 is the degree matrix. The degree matrix for an undirected, unweighted graph is a matrix whose off-diagonal elements are equal to 0 and whose diagonal elements are given by

 	𝐷𝑖𝑖=∑𝑗𝐴𝑖𝑗.	 	 
In other words, the degree matrix of an undirected, unweighted, simple graph is simply a diagonal matrix whose diagonal entries are the degrees of the nodes. In the case of a weighted, undirected, simple graph the definition is the same but the interpretation no longer concerns the degree of the nodes, but rather the sum weight of the edges emanating from the nodes.

## Relaxation of Ideal Clustering

The optimization problem for a given 𝑛1,𝑛2

 	𝐶=min𝐬∈{−1,1}𝑛𝐬𝑇𝐿𝐬,   such that ∑𝑘𝑠𝑘=𝑛1−𝑛2,	 	 
is computationally hard to solve for any real-life graph of decent size. We can therefore relax the integer constraints on the 𝐬 vector and consider the relaxed problem

 	𝐶̂ =min𝐱∈ℝ𝑛𝐱𝑇𝐿𝐱,  ‖𝐱‖=1.	 	 
where we have also ignored the constraint that the components of 𝐱 have to sum up to 𝑛1−𝑛2. The normalization of 𝐱 is necessary or otherwise there is only one trivial solution to the problem – the all-zeros vector.

## Spectral Clustering: Eigenvector Corresponding to Second Smallest Eigenvalue

The relaxed problem leads to an approximate but intuitive solution to the ideal clustering problem.

Self-exercise: First, we can show that

 	𝐱𝑇𝐿𝐱=12∑𝑖,𝑗𝐴𝑖𝑗(𝑥𝑖−𝑥𝑗)2.	 	 
Minimizing the above would lead to a solution 𝐱 that can be interpreted as follows: In the original ideal clustering setup, the multiplier to 𝐴𝑖𝑗 is equal to 0 when two nodes 𝑖,𝑗 belong to the same cluster. The same way, we can treat any two nodes 𝑖,𝑗 whose 𝑥𝑖,𝑥𝑗 values are close as being in the same cluster. And, if the 𝑥𝑖,𝑥𝑗 values are far apart we can classify them into different clusters.

Beyond this intuitive understanding of the relaxed problem, the relaxed problem also has important properties. First the graph Laplacian 𝐿 is a symmetric matrix. Then, using the above expansion we can clearly see that if 𝐴𝑖𝑗≥0, ∀𝑖,𝑗 (which is the likely scenario in most applications) 𝐿 is a positive semi-definite matrix. For a positive semidefinite matrix, the eigenvalues are nonnegative.

In particular, for the Laplacian the smallest eigenvalue is equal to 0. This can be seen from the fact that

 	𝐿1=0,	 	 
where 1 is a vector of ones. Self-exercise: It can also be shown that the multiplicity of the zero eigenvalue is the number of connected components of the simple, undirected graph.

Getting back to the optimization problem

 	𝐶̂ =min𝐱∈ℝ𝑛𝐱𝑇𝐿𝐱,  ‖𝐱‖=1,	 	 
we now know that the optimal value of this problem is equal to 0 since there is an eigenvector (which can be normalized) with 0 eigenvalue. This solution is not satisfying for our clustering since the eigenvector(s) corresponding to the zero eigenvalue(s) pick out essentially the connected components of the graph. In particular, if there is only one component in the graph then 1 is the optimal vector that obtains the optimal cost of 𝐶̂ =0 and this vector provides no information as to how to pick out different clusters in the graph.

Let 0=𝜆1≤𝜆2≤⋯≤𝜆𝑛 be the 𝑛 eigenvalues of 𝐿 and let 𝜆̂  be the second smallest eigenvalue or the smallest non-zero eigenvalue of 𝐿. If there is only one connected component in the graph, this value is also equal to 𝜆2. The eigenvector corresponding to this eigenvalue, denoted 𝐱̂ , turns out to be a good heuristic vector to cluster the graph according to the following rule: nodes whose corresponding 𝑥𝑖 values are close to each other can be assigned a cluster. We can use this procedure to obtain any number of clusters that we wish to in the graph. With 𝐱̂  the cost of the relaxed clustering problem becomes 𝐱̂ 𝑇𝐿𝐱̂ .


## Modularity Maximization

We can approach clustering via several objectives. An objective that is similar to the ideal clustering problem that we saw earlier is modularity maximization (we recommend the learner to review the definition of modularity of a graph). Formally, modularity maximization is the following problem:

 	𝐶=max𝐬∈{−1,1}𝑛∑𝑖,𝑗𝐵𝑖,𝑗(1+𝑠𝑖𝑠𝑗),   where 𝐵𝑖𝑗=𝐴𝑖𝑗−𝑃𝑖𝑗,   such that ∑𝑘𝑠𝑘=𝑛1−𝑛2.	 	 
Here, 𝑃𝑖𝑗 is the expected number of edges between nodes 𝑖,𝑗 in a random graph model. We will study random graph models in the next lecture, but we provide the expressions for a few models here:

Erdos-Renyi: 𝑃𝑖𝑗=2𝑚𝑛(𝑛−1).

Configuration model: 𝑃𝑖𝑗=𝑘𝑖𝑘𝑗2𝑚−1.

Once again, the integer-valued optimization problem is computationally hard and we need to resort to approximate relaxations of the problem (see lecture slides for Louvain method by Blondel et al., 2008).




