## Objectives
In this lecture, we will learn the definitions and properties of four graphical models:

- The definition of the Erdos-Renyi model.
- The edge probability and degree distributions of the Erdos-Renyi model.
- The phase transitions of the Erdos-Renyi model.
- The definition of the Configuration model.
- The edge probability of the Configuration model.
- The definition of Price's preferential attachment model.
- The definition of the Small-World model.

## Erdos-Renyi model

Random graph models are a specification for a graph where the properties of the graph (such as the edges) are generated randomly according to some parameterized probability distribution.

The Erdos-Renyi model is a common model for a random graph. It is parameterized by

𝑛: The number of nodes in the graph.

𝑝: The probability of that any two nodes are connected by an edge.

and the Erdos-Renyi model is denoted by 𝐺(𝑛,𝑝).

The number of nodes in the graph is a set parameter, and is not random. The edges, on the other hand, are drawn randomly from a binomial distribution.

For any pair of nodes in the graph, the probability to connect this pair is independent of all other pairs of nodes. The probability to connect the pair is 𝑝, and so the edge can be modelled as a binomial distribution: Binomial(1, 𝑝).

**Graph Structure of Erdos-Renyi Model**
An Erdos-Renyi model, 𝐺(𝑛,𝑝), displays, in the large node limit of 𝑛→∞, a phase transition in the global graph structure at two points.

For 𝑝<1𝑛, there are many small components. The size of these components tends to be bounded above:

 	𝑃(𝑆max>𝑐ln𝑛)	→0	 as 𝑛→∞	 	 
where 𝑆max is the size of the largest component in the graph, and 𝑐=2𝑚/𝑛 is the average node degree. Note that this is strictly only a bound as 𝑛→∞, for any finite 𝑛 there is a non-zero probability of all nodes being connected.

Between 1𝑛<𝑝< ln𝑛/𝑛, a giant component emerges. This giant component has a size that is a significant fraction of 𝑛, around (𝑐−1)𝑛 for 𝑐≈1 (the relation is not linear for larger 𝑐). There will only be one of these giant components; other components will exist, but they will observe the 𝑆<𝑐ln𝑛 bound discussed above.

Above 𝑝>ln𝑛/𝑛, the giant component includes all nodes in the graph and the graph becomes connected.

Although these phase transitions are only defined in the 𝑛→∞ limit, you can observe them even for 𝑛 as small as 100. When 𝑛 is small, the phase transition points become “fuzzy" in that the transition may not occur at exactly the points described above, but close to them.

## Configuration model

Unfortunately the Erdos-Renyi model does not produce a power-law degree distribution. Power-law degree distributions are commonly observed in natural networks, so we desire a graphical model that will produce such a distribution.

In fact, we can go one step further and define a graphical model that can produce any desired degree distribution. This is known as the Configuration model.

The configuration model starts with a list of the desired degree distributions {𝑘1,𝑘2,…,𝑘𝑛}, with each 𝑘𝑖 denoting the desired degree of node 𝑖. We then assign to each node a number of “stubs", 𝑠𝑖 that is initially equal to the desired degree for that node: 𝑠𝑖=𝑘𝑖. Each stub can be thought of as “half of an edge" as ∑𝑖𝑘𝑖=2𝑚 where 𝑚 is the number of edges for the graph.

Then, two stubs are selected uniformly at random. This means that a node, 𝑖, is selected with probability 𝑠𝑖∑𝑙𝑠𝑙, and a node, 𝑗, is selected with probability 𝑠𝑗∑𝑙𝑠𝑙. Note that this implies 𝑖 can be the same as 𝑗.

Then, these stubs are connected together, removing them, and forming an edge. This means that an edge, {𝑖,𝑗} is inserted into the edge list for the graph. Then, the number of stubs for node 𝑖 and 𝑗 are both reduced by one: 𝑠𝑖←𝑠𝑖−1, 𝑠𝑗←𝑠𝑗−1.

This process repeats until ∑𝑙𝑠𝑙=0.


## Price's model and small-world model

**Price's model**

Price introduced this directed network model in 1976, based on the concept of *preferential attachment*.

The model starts by assuming a graph that has an average node out-degree of 𝑐. During the generation of subsequent nodes, 𝑐 will be kept constant. Each subsequent node is generated one at a time using the following process.

A new node is inserted into the graph. This node is connected to, on average, 𝑐 already existing nodes (the exact mechanism for choosing the out-degree is not important as long as the average is maintained). The target node for each one of these connections is selected in proportion to the in-degree of that node. Because new nodes will have an in-degree of zero, this needs to be modified to “in proportion to the in-degree plus 𝛽" to ensure that new nodes can be connected to subsequent nodes. Therefore, if the in-degree of node 𝑖 is 𝑘𝑖, then node 𝑖 is selected as the target for each connection with probability

 	𝑝𝑖	=𝑘𝑖+𝛽 / ∑𝑖(𝑘𝑖+𝛽).	 	 
This is called a “preferential attachment" model, as new nodes are preferentially attached to already well connected nodes. The result is a kind of “rich get richer" process, and, as the number of new nodes overwhelms the existing nodes in the graph, the node in-degree distribution starts to follow a power-law:

 	𝑝(𝑘)	∝𝑘2+𝛽/𝑐

**Small world model**

When 𝑐>2, the circulant graph will naturally start forming triplets. The number of triplets increases with 𝑐, which leads to a large clustering coefficient.

However, if 𝑐 is fixed and 𝑛 grows, then the diameter of the graph grows as (𝑛). This means that the graph does not represent a small world (where the diameter grows as (ln𝑛)).

This is an undesirable property, as most natural networks are also small world networks. To address this, we can add “short circuits" to the graph.

This can be done by rewiring a few randomly selected edges. Let one of these selected edges be written as {𝑖,𝑗} so that it connects node 𝑖 to node 𝑗. Then the edge is rewired to {𝑖,𝑘} where 𝑘 is randomly and uniformly selected from all nodes in the graph. In particular, 𝑘 is chosen such that 𝑘≠𝑖 (no self-loops) and such that {𝑖,𝑘} is not already an edge in the graph (avoids creating a multi-graph).

For large 𝑛, 𝑘 is very likely to be a large distance from 𝑖, and so this rewiring procedure drastically reduces the diameter of the graph. Only a few edges need to be rewired this way to achieve a small world model, and so the clustering coefficient is largely preserved. Unfortunately, the degree distribution stays very close to 𝑐, and so it does not replicate a power-law distribution.