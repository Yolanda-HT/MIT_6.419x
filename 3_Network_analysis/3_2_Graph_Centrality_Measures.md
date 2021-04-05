## Objectives

In this lecture, we will

- Introduce the notion of centrality .

- Introduce degree centrality and eigenvector centrality and study approaches to computing these measures.

- Understand how eigenvector centrality does not work for directed acyclic graphs (DAGs) and introduce Katz centrality as a better notion of centrality than eigenvector centrality.

- Further introduce page-rank centrality to fix issues with Katz centrality.

- Combine inward and outward importances in one iterative algorithm to compute hubs and authorities scores of nodes in a graph.

- Introduce closeness and betweenness centrality and learn how to compute them.

##  Degree centrality
The degree centrality measures the importance of nodes in terms of the degree of a node. For a directed graph, we have the in-degree and the out-degree of a node:

 	𝑘in𝑖=∑𝑗𝐴𝑗𝑖,    𝑘out𝑖=∑𝑗𝐴𝑖𝑗.	 	 
The degree centrality only captures importance up to one-hop neighbors of a node. Depending upon the application, this may not be representative of the importance of a node in the overall graph.



## Eigenvector Centrality

For a matrix of size 𝑛×𝑛 a value 𝜆 is called an eigenvalue that corresponds to an eigenvector 𝐱 if

 	𝐴𝐱=𝜆𝐱.	 	 
Technically, the vector 𝐱 in the above is a **right eigenvector** of 𝐴. One can also define a **left eigenvector** as a row vector 𝐲𝑇 that satisfies 𝐲𝑇𝐴=𝜆′𝐲𝑇 for a corresponding eigenvalue 𝜆′. Note that all vectors are column vectors and hence 𝐲𝑇 is a row vector.


**Eigenvector Centrality**

The eigenvector centrality of a node is the weighted importance of the nodes pointing to it (left eigenvector centrality) or the nodes that it points to (right eigenvector centrality). Let us consider, for sake of simplicity, the left eigenvectors in this discussion and the description for the case of right eigenvectors follows in a similar fashion with the interpretation that the importance of a particular node captured using right eigenvectors is an indication of how important the neighbors it points to are.

We define eigenvector centrality for a directed graph using the left eigenvector corresponding to the largest eigenvalue of all left eigenvectors. Formally, let 𝐯𝑇 be the left eigenvector corresponding to the largest left eigenvalue 𝜆max. Then, the eigenvector centrality of node 𝑖 is the value at the 𝑖th index of 𝐯 and is denoted 𝑣𝑖.

The interpretation of eigenvector centrality is that the ranking of a particular node 𝑖 satisfies

 	∑𝑗𝑣𝑗𝐴𝑗𝑖	=𝜆max𝑣𝑖,	 	 
and this implies

 	𝑣𝑖=1𝜆max∑𝑗𝑣𝑗𝐴𝑗𝑖.	 	 
To understand the role of the eigenvector corresponding to the largest eigenvalue in defining centrality of a node based on the centrality of its neighbors, we turn to the Perron-Frobenius theorem. Let 𝐲0=1 denote the assginment of same centrality value to all the nodes. Let

 	(𝐲𝑘)𝑇=(𝐲0)𝑇𝐴𝑘	 	 
denote the updated (left) centrality vector after 𝑘 iterations of updating the centrality of every node based on the centrality of its neighbors. We can show, under some conditions of the adjacency matrix 𝐴, that

 	as 𝑘→∞,  (𝐲𝑘)𝑇→𝛼𝜆𝑘max𝐯𝑇.	 	 
The value 𝜆max is the largest eigenvalue of 𝐴 and 𝐯𝑇 is its corresponding left eigenvector. The constant 𝛼 depends upon the choice of the initial centrality vector. Perron-Frobenius theorem ensures that the eigenvector 𝐯𝑇, which corresponds to the largest eigenvalue, is a non-negative, non-zero vector. This satisfies a key requirement that our ranking of importance of every node be non-negative and that there is at least one node that has a non-zero importance.

For these exercises we will require that the left eigenvectors be normalized as follows:

∑𝑖𝑣2𝑖‾‾‾‾‾‾√=1,
 
as not all linear algebra libraries use the same normalization conventions.

## Page-Rank Centrality

Katz centrality and eigenvector centrality assign a relatively high importance value to a node 𝑖 that has an incoming edge from a node 𝑗 that is of high importance and has no other incoming edges. If node 𝑗 has a very high out-degree then node 𝑖 is just one of the many neighbors that node 𝑗 points to. In some applications, we may require that such a node 𝑖 not have very high importance simply because it has an incoming edge from a node of very high importance.

Page-rank centrality modifies Katz centrality to obtain a centrality measure that addresses this requirement. In particular, page-rank centrality weighs the contributions of all neighbors of a node by their respective out-degree values:

 	(𝐲𝑘+1)𝑇=𝛼(𝐲𝑘)𝑇𝐷−1𝐴+𝛽1𝑇,   where 𝐷=diag(𝑘out1,…,𝑘out𝑛).	 	 
With a choice of 𝛼 in the interval (0,1/𝜆max(𝐷−1𝐴)), we can show that the recursive updates converge to 𝐯𝑇, where 𝐯𝑇=𝛽1𝑇(𝐈−𝛼𝐷−1𝐴)−1.

The library networkx does not enforce a normalization condition on the page-rank centrality vector, and so we will follow that convention here.


## Hubs and Authorities

We now define two interdependent notions of centrality and combine them in a mutual recursion. An important hub is a node that points to many important authorities . An important authority is one that is pointed to by many important hubs.

We begin with an initial assignment of hub and authority scores for every node 𝐱0 and (𝐲0)𝑇, respectively. The updates are as follows:

 	𝐱𝑘+1=𝛼𝐴𝐲𝑘,    (𝐲𝑘+1)𝑇=𝛽(𝐱𝑘+1)𝑇𝐴.	 	 
Choosing 𝛼𝛽=1/𝜆max(𝐴𝐴𝑇), we can show that 𝐱𝑘→𝐯 and (𝐲𝑘)𝑇→𝐰𝑇, where 𝐴𝐴𝑇𝐯=𝜆max(𝐴𝐴𝑇)𝐯 and 𝐴𝑇𝐴𝐰=𝜆max(𝐴𝑇𝐴)𝐰. In fact, the non-zero eigenvalues of 𝐴𝐴𝑇 and 𝐴𝑇𝐴 are the same and 𝐰=𝐴𝑇𝐯.

## Closeness Centrality and Betweenness Centrality

The closeness centrality of a node 𝑖 is the reciprocal of average distance of the node to every other node. Recall that 𝑑𝑖𝑗 is the shortest path length (smallest weight path, in weighted graphs) between node 𝑖 and 𝑗. The closeness centrality of node 𝑖 is given as

 	𝐶𝑖=(1𝑛−1∑𝑗≠𝑖𝑑𝑖𝑗)−1	 	 
The measure of “high" or “low" value of closeness centrality is relative. A high closeness centrality 𝐶𝑖, relative to the closeness centrality of the other nodes, indicates that node 𝑖 is relatively close to all the other nodes.

The betweenness centrality measures the extent to which a node lies on paths between other nodes.

 	𝐵𝑖=∑𝑠≠𝑖≠𝑡𝑛𝑖𝑠𝑡𝑔𝑠𝑡,	 	 
where 𝑛𝑖𝑠𝑡 is the number of shortest paths between 𝑠 and 𝑡 that pass through 𝑖 and 𝑔𝑠𝑡 is the total number of shortest paths between 𝑠 and 𝑡. Note that this considers both orderings of each pair of nodes, so for undirected graphs, a path counts twice (as it counts both for 𝑛𝑖𝑠𝑡 and for 𝑛𝑖𝑡𝑠).