## Objectives

In this lecture, we will:
- Learn the definition of a graph and different types of graphs we will use.
- Learn what is an adjacency matrix and use it.
- Learn the following graph metrics: connected components, degree distribution, path lengths, shortest paths, diameter, average distance, clustering coefficient, and modularity.
- Learn how these graph metrics capture real-world notions about networks.

## Introduction to Networks

*[Seven Bridges of Konigsberg](https://en.wikipedia.org/wiki/Seven_Bridges_of_K%C3%B6nigsberg)*
![Seven bridges problem](https://upload.wikimedia.org/wikipedia/commons/5/5d/Konigsberg_bridges.png)

**Graphical Models versus Network Models**
- Graphical models: Data on the nodes, infer network (randomness on the nodes)
- Network modedels (random graph models): data on the edge (randomness on the edges)

## Graph Metrics – A Measure of Clustering and Modularity


**Triangle Density and Clustering Coefficient**
The **triangle density** of a graph is the ratio of number of triangles in the graph to the number of possible triangles:
	triangle density≜# of triangles/(𝑛3)

Triangle density is not an appropriate metric to measure clustering for several reasons. First, it does not take into account that the graph could have several connected components, in which case the denominator might be much larger than the numerator. Second, even in the case of a connected graph any three nodes need not be present in the same cluster (the shortest path lengths connecting them may be much larger).

A better metric for clustering is the **clustering coefficient**, denoted 𝐶, which measures the ratio of triangles in the network to the number of connected triples:

	𝐶	=# of closed triplets / # of closed and open triplets = 3⋅# of triangles / # of connected triples

Where an open triplet is three nodes connected by two edges, and a closed triplet is three nodes connected by three edges. This can be written in terms of the adjacency matrix as:

𝐶	=∑𝑖,𝑗,𝑘𝐴𝑖𝑗𝐴𝑗𝑘𝐴𝑘𝑖 / ∑𝑖𝑘𝑖(𝑘𝑖−1)

Where 𝑘𝑖=∑𝑗𝐴𝑖𝑗 is the degree of node 𝑖.

To understand this formula, first consider the numerator. Note that ∑𝑖,𝑗,𝑘𝐴𝑖𝑗𝐴𝑗𝑘𝐴𝑘𝑖=∑𝑖[𝐴3]𝑖𝑖=tr𝐴3, that is, the trace of 𝐴3. We know that [𝐴3]𝑖𝑖 is equal to the number of walks of length 3 from node 𝑖 to itself, which will be two if it is part of a closed triplet (there are two paths around the triplet) and zero otherwise. So the sum of the diagonal elements of 𝐴3 is exactly twice the number of closed triplets (and six times the number of triangles, as each node in the triangle is counted once).

As for the denominator, let us examine how the degree of a node informs the number of connected triplets. If a node has degree zero, then it can't be part of a triplet, and the same is true for degree one. For a node of degree two, it must be part of one triplet (which may be closed or open). For degree three, the node is part of three triplets. We conclude that for a node of degree 𝑘, the node is part of (𝑘2)=𝑘(𝑘−1)/2 connected triplets. Therefore the total number of connected triplets is the sum of this formula for all nodes: ∑𝑖𝑘𝑖(𝑘𝑖−1)/2.

One can also define the same node-wise. For node 𝑖, the local clustering coefficient 𝐶𝑖 is defined as

 	𝐶𝑖	=# of triangles at node 𝑖# of connected triples centered at node 𝑖	 	 
 	 	=∑𝑗,𝑘𝐴𝑖𝑗𝐴𝑗𝑘𝐴𝑘𝑖𝑘𝑖(𝑘𝑖−1)	 	 


## Graph Properties and Metrics - I

Quantitative measures of networks to describ structural patterns of a network and to compare networks:
- Connected coponents
- Edge density
- Degree distribution
- Diameter and average path length
- Clustering
- Homophily or assotative mixing


**Degree distribution**
- Degree of node i: km
- Average degree: 1/n * sum(Km) = 2m/n where |V| = n, |E| = m (# vertices, # edges)
- More information captured by degree distribution
	- Histogram of fraction of nodes with degree k
- Special type of degree distribution: power-law distribution:
	logpk = -alpha * logk + c for xome alpha, c >0
	- Tail of distribution is fat, i.e. there are many nodes with high degress
	- Appears linear on a log-log plot
	- Appear in wide variety of settings including WWW, Internet

**Edge density**
	ρ = m / (n 2) = sum(Aij) / n(n-1)
	- Different kinds of networks show very different edge densities
	- Most networks are sparse, n -> ∞, ρ -> 0
	- Some networks are dense, n -> ∞, ρ -> const


**Connected Components**

Given an undirected graph a connected component is a subset of nodes 𝑉′⊂𝑉 such that the induced graph on 𝑉′ has the following properties: There exists a walk from 𝑣𝑖 to 𝑣𝑗 whenever 𝑣𝑖,𝑣𝑗∈𝑉′ and there is no walk from 𝑣𝑖 to 𝑣𝑗 whenever 𝑣𝑖∈𝑉′ and 𝑣𝑗∈𝑉∖𝑉′.

The notion of a connected component as defined for an undirected graph does not translate directly to the case of a directed graph where walks have directions. In a directed graph a related notion we can define is strong connectivity . A set of nodes 𝑉′⊂𝑉 is said to be strongly connected if every vertex in 𝑉′ is reachable from every other vertex in 𝑉′ and there exists some vertex in 𝑉′ and some vertex in 𝑉∖𝑉′ such that there is no directed path between such vertices in at least one direction.

**Power Law Distribution**

The power law distribution is defined by the following log-log relationship between 𝑘 and 𝑝𝑘:

 	log𝑝𝑘=−𝛼log𝑘+𝑐,   𝛼,𝑐>0.	 	 
The distribution models scenarios that require the tail of the distribution to decay polynomially rather than exponentially. With a simple transformation, one can see that 𝑝𝑘 decays as 𝑘−𝛼.

**Edge Density**

The edge density 𝜌 of a graph with 𝑛 nodes and 𝑚 edges is defined as

 	𝜌=𝑚/(𝑛2).	 	 
This is a metric that captures the fraction of (all possible) edges present in an unweighted graph.

## Graph Properties and Metrics - III

Length of a Path, Diameter, and Average Distance

Let 𝑑𝑖𝑗 be the length of the shortest path (or the path with the smallest weight in the case of a weighted graph) between node 𝑖 and 𝑗. The diameter of a graph is the largest distance between any two nodes:
 	diameter=max𝑖,𝑗∈𝑉 𝑑𝑖,𝑗.	 	 
We can also define the notion of average shortest path length :
 	average path length=1(𝑛2)∑𝑖≤𝑗𝑑𝑖𝑗.	 	 
These notions are defined component-wise in case the graph is not connected. The definition of what constitutes a component, as we have seen before, varies between an undirected graph and a directed graph.






