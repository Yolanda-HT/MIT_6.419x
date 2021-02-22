## Objectives

At the end of this lecture, you will be able to:

- Perform the Fisher Exact Test , and compute the  𝑝 -value using the hypergeometric distribution .

- Apply the z-test and the t-tests on continuous data.

- Set up and perform hypothesis tests under assumptions and scenarios simular to the studies discussed.

- Choose appropriate test statistic for hypothesis tests and find their distributions.

- Discuss the usage and assumptions of the t-statistic and the t-distribution .

- Use various tests to evaluate whether a data set can be considered approximately normal.

- Compute a confidence interval for a parameter.

## Different hypothesis Test for the mammography experiment

In the last lecture, we covered the basics of hypothesis testing with the HIP mammography study as our example. The study's aim is to determine whether offering mammographies for breast cancer detection reduces the rate of death due to breast cancer. There are  31000  individuals in each of the treatment and control groups; only those in the treatment groups are offered mammographies.

We recap the elements of the hypothesis testing framework. In the mammography study, they are:

- the Parametric Model. We can write indicator variables for whether each patient in the treatment group dies of breast cancer as  𝑋1,…,𝑋31000∼𝑖.𝑖.𝑑.Bernoulli(𝜋) , and we can also approximate the total number of deaths as  𝑌=𝑋1+…+𝑋31000∼Poisson(𝜆) .

- The null hypothesis  𝐻0 :  𝜋=0.00203  (equivalently  𝜆=63 , and the alternative hypothesis  𝐻𝐴 :  𝜋<0.00203  (equivalently  𝜆<63 ). We then decide whether or not to reject the null hypothesis based on a test.

- The test statistic  𝑇 . We define  𝑇  to simply be the number of deaths  𝑌  in the treatment group. Under  𝐻0 , it is distributed as  𝑇∼binomial(31000,0.00203) . This distribution can also be approximated as  𝑇∼Poisson(63) . The role of  𝑇  is to distinguish between  𝐻0  and  𝐻𝐴 .

- The significance level  𝛼=0.05 . This is the probability of rejecting the null hypothesis  𝐻0  when it is in fact true (type I error), that is, the probability of concluding there is an effect when there is none. Generally, the threshold of the test statistic for rejecting the null hypothesis is set based on a chosen significance level.

- The p-value  𝑝 . This is the probability that the test statistic, under the null hypothesis, takes a value more extreme (towards the direction of the alternative hypothesis) than the one observed. This probability can be computed from the test statistic  𝑇  and the given parametric model. The  𝑝 -value varies with the observed value of data, and when  𝑝<𝛼 , the  𝐻0  is rejected.

- The power of the test. This is the probability of rejecting  𝐻0  when  𝐻𝐴  is true (avoiding a type II error:  1−𝑃(type II error) ). It is useful to write the power as a function of the parameter, when more than one parameter value is considered for  𝐻𝐴 .

Throughout the hypothesis test, we focused on the observed death rate in the treatment group as the variable, and compare it to  𝜋=0.00203 , the observed death rate in the control group. The question below examines the validity of this approach.

## Hypergeometric Distribution

The hypergeometric distribution is a discrete distribution based on the following probability problem:

“Suppose there are  𝑁  balls in a bowl,  𝐾  of which are red and the remaining  𝑁−𝐾  of which are blue. From the bowl,  𝑛  balls are drawn without replacement. What is the probability that among the  𝑛  balls drawn, exactly  𝑥  are red?"

The solution to this problem is given by the following pmf:

 	 ℙ(𝑋=𝑥) 	 =(Number of ways to choose 𝑥 out of 𝐾 red balls)⋅(Number of ways to choose 𝑛−𝑥 out of 𝑁−𝐾 blue balls )Number of ways to choose 𝑛 balls out of𝑁 	 	 
 	 	 =(𝐾𝑥)(𝑁−𝐾𝑛−𝑥)(𝑁𝑛). 	 	 


This pmf defines the hypergeometric distribution  Hypergeometric(𝑁,𝐾,𝑛)  with the three parameters:

- 𝑁 , size of population (number of balls in bowl)

- 𝐾 , size of sub-population of interest (number of red balls in bowl)

- 𝑛 , the number of targeted outcomes (total number of balls drawn).

Mammography study: Modified Hypotheses and Hypergeometric Distribution

In the mammography study, another approach to test for treatment effect is to compare the numbers of breast cancer deaths in treatment and control groups on equal footing (instead of using the estimate of the control group as the status quo as before). That is, we now state the null hypothesis to be the death rates in the two groups are the same and the alternative hypothesis to be the death rate in the treatment is smaller:

Null hypothesis  𝐻0 :  𝜋𝑡𝑟𝑒𝑎𝑡𝑚𝑒𝑛𝑡=𝜋𝑐𝑜𝑛𝑡𝑟𝑜𝑙 

Alternative hypothesis  𝐻𝐴 :  𝜋𝑡𝑟𝑒𝑎𝑡𝑚𝑒𝑛𝑡<𝜋𝑐𝑜𝑛𝑡𝑟𝑜𝑙 

where  𝜋𝑡𝑟𝑒𝑎𝑡𝑚𝑒𝑛𝑡  and  𝜋𝑐𝑜𝑛𝑡𝑟𝑜𝑙  are the death rates in the treatment and control groups respectively.

## Paired tests and continuous data

The previous example had discrete observations, as our smallest relevant unit of observation is a binary variable that indicates whether a particular patient died of breast cancer. In many applications, however, the variable of interest may take on a values from a subset of  ℝ  instead (such as an interval). We will examine one such study, which is evaluating the efficacy of a new sleeping drug.

**Sleeping drug study**

Suppose that a drug company is developing a new sleeping aid drug, which purportedly helps users suffering from insomia to increase their sleeping time each night. Validating whether this drug is effective is a hypothesis testing problem.

Recall the following important elements of an experimental design:

- Control and treatment groups: There has to be a baseline for comparison.

- Randomization: The treatment assignment has to be random to avoid biases due to differing baseline average values in the two groups.

- Double-blindness: Patients should not know whether they received the placebo (control) or the actual drug (treatment) since knowing this may influence their behavior. Similarly the experimenters should not know who received treatment.

Based on the above, a basic idea would be to adapt a similar framework as the mammography study. We can take a large sample, split them into a treatment group, who will get the actual drug, and a control group, who will receive a placebo. We could then observe the number of hours slept in each group, set up a probability model, and continue the hypothesis testing procedure.

However, even though this approach is valid, the power of this hypothesis test might not be very high, especially if the sample size is small. Indeed, people have a wide range of sleep lengths, and it might be difficult to discern anything due to this noise. An approach to reduce this noise is through a **paired test design**.

**Paired test design**

A paired test design involves taking multiple samples from an individual, one corresponding to a control situation and the other to a treatment situation. This allows us to estimate the effect on a particular individual. In the sleeping drug study, we want to observe the effect of taking the sleeping drug towards hours slept at night.

In a paired test, it is the difference between the observed values in the treatment and the control situations, i.e.  𝑌𝑖:=𝑋𝑖,treatment−𝑋𝑖,control  that will be considered. A null hypothesis that states that the treatment has no effect is equivalent to claiming that  𝔼[𝑌𝑖]=0 .

**Randomization and double-blindness in a paired test**

The usage of a paired test design removes the need for randomness in the treatment assignment, as each individual is observed for both the control and the treatment settings. However, randomization is still used to ensure that the individuals do not know whether they are in the treatment or the control group in each of the two trials, the double-blindness in the experiment.

In the sleeping drug study, this can be done by having two separate observation periods for each individual. Each individual is given the placebo in one period and the actual drug in the other, the assignment of which between the two is done at random. Also, having sufficient time between the two periods will prevent spillover effects of the drug from the first to the second.

A paired study like this cannot always be done, as it requires the possibility of having two distinct, independent observations and treatments for each indivdual. For example, in the mammography study we discussed, the effects of early breast cancer screening is lifelong, so we cannot measure or estimate the effect on a particular individual of having a mammography.


## Z-test

In this section, we will discuss a popular and versatile to approach to hypothesis testing on continuous data, the  𝑧 -test , which makes use of the Central Limit Theorem (CLT). We will apply this test to the sleeping drug study.

Afterwards, we will see how the  𝑧 -test is also helpful as an approximation when the data is discrete, such as in the mammography study.

Modeling choice for the sleeping drug study

When our data was binary, we are typically limited to the Bernoulli model and the corresponding binomial model for the number of targeted observations. When our data can take on continuous values, we have more choices. Depending on the application, we can one of several well-known distributions, including the uniform, exponential, and normal distributions.

Recall the data collected for the sleeping drug study:

Suppose our candidate models for the difference in number of hours slept are the uniform and the Gaussian models. Both the support and the distribution are important considerations:

- The support of a model is the set of values that the observations can take in the model. In the sleeping drug study, the number of hours slept in a day is bounded above, so the difference is also bounded. This points in favor of the uniform model, as it has a bounded support, while a Gaussian model always has unbounded support.

- The distribution of a continuous model is based on the shape of the pdf. In model selection, this can be decided based on solving a theoretical model, looking at the empirical distribution of observations, or common knowledge. The number of hours slept by an adult is known to be centered around  8  hours, and outliers tend to be rare, so this points towards the Gaussian model for the sleeping drug study.

Weighing these two considerations, in the sleeping drug study, we select the normal distribution and then ensure that the variance parameter is sufficiently small, so that the probability of falling outside the realistic boundary is negliible.

Furthermore, we can argue towards a normal distribution by reasoning that the number of hours slept is a cumulative effect of a large number of biological and lifestyle variables. As a lot of these variables are unrelated to one another, the cumulative effect can be approximated by a normal distribution. This is justified by the Central Limit Theorem (CLT), which is covered in more detail below, and is the important result that establishes the  𝑧 -test.


Furthermore, we can argue towards a normal distribution by reasoning that the number of hours slept is a cumulative effect of a large number of biological and lifestyle variables. As a lot of these variables are unrelated to one another, the cumulative effect can be approximated by a normal distribution. This is justified by the Central Limit Theorem (CLT), which is covered in more detail below, and is the important result that establishes the  𝑧 -test.

**Central limit theorem (CLT) and the z-test statistic**

Suppose that we have observations  𝑋1,…,𝑋𝑛 , which are independent and identically distributed based on a probability model. Under a few regularity assumptions (such as the model having a finite second moment), the distribution of the sample mean  𝑋⎯⎯⎯⎯⎯  will approximate a normal distribution when sample size becomes sufficiently large (typically  𝑛≥30 ).

The central limit theorem (CLT) states that: When sampling random variables  𝑋1,…,𝑋𝑛  from a population with mean  𝜇  and variance  𝜎2 ,  𝑋¯  is approximately normally distributed with mean  𝜇  and variance  𝜎2/𝑛  when  𝑛  is large:

𝑋⎯⎯⎯⎯⎯:=𝑋1+𝑋2+…+𝑋𝑛𝑛∼(𝜇,𝜎2𝑛)for 𝑛large. 
 


Hence, we can define a test statistic  𝑧=𝑋⎯⎯⎯⎯⎯−𝜇𝜎/𝑛√ , which approximately follows a standard normal distribution when  𝑛  is large:

𝑧=𝑋¯−𝜇𝜎/𝑛√∼(0,1). 
 
The test statistic  𝑧  is called an (approximate) **pivotal quantity**, since its (approximate) distribution does not depend on the paramaters  𝜇  or  𝜎 . We can use the cdf of a pivotal quantity to compute the  𝑝 -value (which is the probability for the test statistic to take on a value at least as extreme as the one observed), and compare the  𝑝 -value with with  𝛼  the significance level to decide whether to reject the null hypothesis  𝐻0 .

**𝑍 -test in the sleeping drug study?**

We are interested in testing the efficacy of a sleeping drug. The data collection process recorded the hours of sleep of  10  patients under the drug and under the placebo:


Now, we want to answer the question:

"Does the drug increase hours of sleep enough to matter?"

We model the difference of hours of sleep between the drug and the placebo for each patient as a normal random variable:

Model:  𝑋1,...,𝑋10∼(𝜇,𝜎2)  ( 𝑋1 , for example, would be:  6.1−5.2=0.9 ).

From this, we state the hypotheses for a one-sided test:

- Null hypothesis ( 𝐻0 ):  𝜇=0 

- Alternative hypothesis ( 𝐻𝐴 ):  𝜇>0 .

Since the data  𝑋𝑖  are modeled as independent Gaussians, the  𝑧 -test statistic described above has an standard normal distribution under the null hypothesis  𝐻0 , even without using the central limit theorem.

We consider using  𝑧  as the test statistic. However, to calculate  𝑧=𝑋¯𝜎/𝑛√ , we need to know the true value of the variance  𝜎 . Since we do not know the population variance in this experiment, we cannot use the  𝑧 -test.

In general, if samples cannot be modeled as Gaussian variables, then the sample size also needs to be large in order to use the standard normal to approximate  𝑧  using the CLT.

The  𝑡 -test resolves both issues of the unknown true variance and the required large sample size.


We again use the same setup with observations  𝑋1,…,𝑋𝑛∼𝑖.𝑖.𝑑.(𝜇,𝜎2) . The model parameter  𝜇  is not known, but  𝜎2  is known (or we are able to assume a value for  𝜎2 ).

Suppose that we are interested to infer the population mean  𝜇  based on the observations and our model, but we are more interested in a range of realistic values. Such a range is called a confidence interval.

## Confidence interval

A confidence interval is an interval that is a function of the observations. It is closely related to the question of estimating the mean, as:

- it is centered around the sample mean

- its width is proportional to the standard error.

The confidence interval is also parametrized by the significance level  𝛼 . The interval is defined so that with probability  1−𝛼 , the interval will contain the true mean  𝜇 . This “probability" means that if we sample the dataset numerous times and calculate intervals for each time, the probability that  𝜇  is in the proposed range (resulting intervals) is  1−𝛼  .

It could be defined as:

𝐼(𝑋)={𝜃|𝐻0:𝜇=𝜃  can not be rejected at significance level  𝛼 , given the data  𝑋} .
Figure below shows the probability of z-test statistic can take between  −Φ−1(1−𝛼/2)  and  Φ−1(1−𝛼/2) , where  Φ  is the Cumulative Distribution Function of the standard normal distribution,  𝛼  is the significant level.

Probability Review: Cumulative Distribution Function
Show


which means that:

 	 𝑃(−Φ−1(1−𝛼/2)≤𝑋¯−𝜇𝜎/𝑛√≤Φ−1(1−𝛼/2))=1−𝛼 	 	 
when we isolate  𝜇 , the formula is equals to:

 	 𝑃(𝑋¯−𝜎𝑛√Φ−1(1−𝛼/2)≤𝜇≤𝑋¯+𝜎𝑛√Φ−1(1−𝛼/2))=1−𝛼 	 	 
Hence, the confidence interval for true parameter  𝜇  with probability  1−𝛼 :

 	 𝑋¯±𝜎𝑛√Φ−1(1−𝛼/2) 	 	 
The figure shows the confidence interval for 100 times stimulation (sampling the dataset for 100 times). The probability where  𝜇  falls into interval section is  1−𝛼 . As you can see from the figure,  𝜇  (red vertical line) is in the range of intervals (black horizontal line) in most of cases.











