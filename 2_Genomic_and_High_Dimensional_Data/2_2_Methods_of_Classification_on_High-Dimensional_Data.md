## Objectives

At the end of this lecture, you will be able to :

- Estimate classify data using Bayes Rule .

- Find the decision boundaries between two classes of data using quadratic discriminant analysis (QDA) and linear discriminant analysis (LDA) .

- Use linear discriminant analysis to visualize data in lower dimensions.

- Perform logistic regression as a method of classification.

- Write down the optimization problem for support vector machines (SVM) .


## Classification Problem

Given data  𝑋(1),𝑋(2),…,𝑋(𝑛)  that take value in  ℝ𝑝 . A classification problem is a problem in which we look for a function

𝑓:ℝ𝑝→where ={𝐶1,…𝐶𝑘} 
 
that maps the sample space of the data into a set of class labels  ={𝑐1,…𝑐𝑚} . This function is called a **classifer** .

The goal of a classification problem is to predict the class that an unseen data point belongs to. In this lecture, we will discuss classification methods in a **supervised learning setting**, where data with true class labels are available.

**Methods of Classification**

We will begin with methods with the most model assumptions and proceed to those with least assumptions:

- Classification using Bayes Rule

- Quadratic discriminant analysis (QDA) and Linear discriminant analysis (LDA)

- Logistic regression

- Support vector machine (SVM).

- Neural networks are also commonly used for classification. They are complex models defined by many parameters. Counter to intuition in classical statistics where overfitting generally occurs as models become too complex, neural networks generalize very well to unseen data, exactly due to the super over-parameterization of the model. We will not discuss neural networks.


### Bayes Rule
Given two events  𝐴  and  𝐵 , Bayes' Rule says that

 	 𝐏(𝐴|𝐵)=𝐏(𝐵|𝐴)𝐏(𝐴)𝐏(𝐵). 	 	 
That is, the conditional probability of event  𝐴  given event  𝐵  can be written in terms of the conditional probability of event  𝐵  given event  𝐴  and the marginal probabilities  𝐏(𝐴)  and  𝐏(𝐵) .

For random variables  𝑋 ,  Θ , Bayes' rule states analogously that

 	 𝐏(Θ=𝜃|𝑋=𝑥)=𝐏(𝑋=𝑥|Θ=𝜃)𝐏(Θ)𝐏(𝑋). 	 	 
In this lecture, we will generally be considering continuous variables  𝑋  that take values in  ℝ𝑝  modeling the data, and finite discrete variables  Θ  respresenting the classes that we would like to categorize the data into.

### Bayes Rule for Classification

Let  𝑋  be a random variable (or vector) modeling the data, and  𝐶  be a random variable representating class labels. Assume the model  𝐏(𝑋|𝐶)  for the data in different classes, and assume a prior distribution  𝐏(𝐶)  for the classes. We can then estimate the class label of data point  𝑥  by finding the class that maximizes the posterior distribution  𝐏(𝐶|𝑋=𝑥) , which is given by Baye's rule:

 	 𝐏(𝐶|𝑋)=𝐏(𝐶)𝐏(𝑋|𝐶)𝐏(𝑋)∝𝐏(𝐶)𝐏(𝑋|𝐶). 	 	 
(We dropped the overall factor  𝐏(𝑋)  since that does not affect which the maximization of  𝐏(𝐶|𝑋) .)

The prior distribution  𝐏(𝐶)  of the class labels can be either based on prior studies and knowledge, or estimated from the prevalence in the training data.

In the special case of classification into only two classes, a decision boundary is a hypersurface such that data on one side are classified as one of the two classes, and data on the other side are classified into the other class.