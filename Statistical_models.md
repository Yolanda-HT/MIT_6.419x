# Statistical models

## Bernoulli model and Binomial model
Bernoulli model: describes discrete events or their corresponding indicator variables
Binomial model: describes the sum of a fixed number of indepndent indicator variables

**Bernoulli distribution**

**Binomial distribution**


### Poisson distribution
The **Poisson random variable** is based on taking the limit of a binomial distribution with a fixed mean  𝑛𝑝 . As we take  𝑛→∞ , the distribution converges to a fixed discrete pmf which we parameterize by  𝜆=𝑛𝑝 . Indeed, we can compute the probability of  𝑘  successes, substitute  𝑝=𝜆/𝑛 , and then take the limit.

 	 lim𝑛→∞(𝑛𝑘)𝑝𝑘(1−𝑝)𝑛−𝑘 	 =lim𝑛→∞𝑛!𝑘!(𝑛−𝑘)!𝑝𝑘(1−𝑝)𝑛−𝑘 	 	 
 	 	 =lim𝑛→∞𝑛(𝑛−1)…(𝑛−𝑘+1)𝑘!(𝜆𝑛)𝑘(1−(𝜆𝑛))𝑛−𝑘 	 	 
 	 	 =lim𝑛→∞𝑛(𝑛−1)…(𝑛−𝑘+1)𝑛𝑘𝑛𝑘𝑘!𝜆𝑘𝑛𝑘(1−(𝜆𝑛))𝑛−𝑘 	 	 
 	 	 =lim𝑛→∞(𝑛(𝑛−1)…(𝑛−𝑘+1)𝑛𝑘)𝜆𝑘𝑘!(1−(𝜆𝑛))𝑛−𝑘 	 	 
 	 	 =(1)𝜆𝑘𝑘!𝑒−𝜆=𝑒−𝜆𝜆𝑘𝑘!. 	 	 
Therefore, when data follows binomial distribution with large  𝑛  (number of trials) and small  𝑝  (probability of success), Poisson( 𝑛𝑝 ) is a good approximation to Binomial( 𝑛,𝑝 ).

### Hypergeometric distribution

The **hyper geometric distribution** is a discrete distribution based on the following probability problem:
“Suppose there are  𝑁  balls in a bowl,  𝐾  of which are red and the remaining  𝑁−𝐾  of which are blue. From the bowl,  𝑛  balls are drawn without replacement. What is the probability that among the  𝑛  balls drawn, exactly  𝑥  are red?"

The solution to this problem is given by the following pmf:

 	 ℙ(𝑋=𝑥) 	 =(Number of ways to choose 𝑥 out of 𝐾 red balls)⋅(Number of ways to choose 𝑛−𝑥 out of 𝑁−𝐾 blue balls )Number of ways to choose 𝑛 balls out of𝑁 	 	 
 	 	 =(𝐾𝑥)(𝑁−𝐾𝑛−𝑥)(𝑁𝑛). 	 	 


This pmf defines the hypergeometric distribution  Hypergeometric(𝑁,𝐾,𝑛)  with the three parameters:

- 𝑁 , size of population (number of balls in bowl)

- 𝐾 , size of sub-population of interest (number of red balls in bowl)

- 𝑛 , the number of targeted outcomes (total number of balls drawn).

## Gaussian distribution

## T-distrubution

## Uniform distribution

## Chi-squired distribution




