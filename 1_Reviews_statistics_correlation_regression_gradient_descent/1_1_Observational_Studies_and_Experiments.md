## Objectives

At the end of this lecture, you will be able to:

- Recognize different aspects of experimental design .

- Address various practical considerations in the data collection process using methods such randomized controlled trials and double-blinded studies .

- Identify the appropriate causal effects in a given context.

- Model data using a Binomial distribution and approximate with the corresponding Poisson distribution.

- Formulate appropriate null and alternative hypotheses and construct the appropriate test statistic to conduct the corresponding hypothesis test at a given significance level , in context close to the mammography study discussed.

- Calculate the p-value of a sample and the power of a test.


## Introduction

This lecture sets up the basics of randomized experiments, hypothesis testing, and data modeling. The next two lectures will then cover further methods for hypothesis testing and approaches to multiple hypothesis testing. They will build on the basic methods in this lecture to achieve better methodological accuracy and more generalizable models.

The discussion will be guided by a study conducted by the Health Insurance Program that offered mammographies for early detection of breast cancer, where the objective is to determine whether offering mammographies will lead to fewer deaths due to breast cancer. From this example, we will discuss two main considerations:

- the role of proper experimental design in setting up the study

- considerations for the data collection process in order to do valid inference

As you follow the discussion videos, your main take-away should not be particular details about this study. Rather, you should focus on developing an intuition on the important considerations for a study, as you may be conducting similar experiments or analyzing similar datasets of your interest in the future.

### Introducing the mammography study

Breast cancer is one of the most common fatal diseases among women. The earlier breast cancer is detected in a patient, the more likely it is for the patient to have a recovery and thus survive the disease. Screenings, as a result, play a large role in preventing breast cancer fatalities, and women over the age of 50 are nowadays advised to undergo a mammography once every two years.

While it may be intuitive to reason that mammographies prevent breast cancer fatalities through early detection, there are reasons to confirm this with data. For example, a local government may be considering standardizing mammographies as part of a healthcare plan. Having an estimate of the actual effect will allow one to evaluate the benefits of doing so in light of its costs.

## Introduction to experimental design and hypothesis testing

**Experimental design: variables**

Consider the overarching task to determine whether mammographies are effective in preventing breast cancer deaths. An experiment frames this in terms of assessing the effect of one variable to another. The most basic setting has two variables:

- the treatment variable , also called the independent variable , is what we are able to modify and is what causes the changes to other variables

- the outcome variable , also called the dependent variable , is what we observe and is what is affected by the treatment variable.

The goal of the experimental and statistical procedures is to establish the link between the treatment and the outcome variables. We call the overall procedure the experimental design .

**Treatment and outcome variables in the mammography study**

For the mammography study, we determine what is the treatment variable and what is the outcome variable. We start with the outcome variable since it is more straightforward.

For the outcome variable, we could set this to be whether a given person (in the study) dies of breast cancer. This is the real-life outcome that we intend to prevent. It is also a defined quantity (in both an aggregate and in unit treatment terms).

For the treatment variable, a natural first answer is whether or not a specific individual underwent mammography. It is, however, functionally infeasible to directly apply the “treatment" of making someone undergo mammography, since they may be simply unwilling to. We thus settle on the treatment variable to be whether someone is offered mammography,

By carefully defining the treatment and outcome variables in this study, we are able to specify what this study will analyze. The concrete definitions for these variables will also guide the data collection and analysis procedure.

**Hypothesis testing**

The essence of hypothesis testing can be boiled down to the scenario where we have a claim and corresponding data that could help us evaluate its accuracy. In short, we want to answer the questions whether the data supports the claim or not. The claim is called the “hypothesis," and so the procedure is called “hypothesis testing."

Ideally, if we have access to all possible data in all possible outcomes of the world, we can reduce this to an arithmetic computation. In a more realistic situation, however, we only have a subset of the population that we have selected to work with. This generates an element of uncertainty, as we cannot control exactly which sample we obtain, and this is what gives rise to statistics.

We will start off by covering the data collection process, which is the process by which we generate these samples. This is part of the larger concept of experimental design, which also covers the procedure where we take the collected data to perform the appropriate inference about the hypotheses we have set up.

## Study considerations and properties

Some experiment properties to consider

From our setup so far, we discuss a few relevant points in designing our study.

Patient selection: Some populations are more likely to develop breast cancer than others depending on their prior health background, so the interpretation of any result we obtain will depend on how we have defined our selection procedure. In general, how we select the treatment and control groups will influence the population for which the conclusion is valid.

- Control group: We need to compare the outcome variable for those who have received the treatment with a baseline. Here, the control group must be a comparable set of people to those who have been offered a mammography, but who were not offered one.

- Features of the patients: One way to make accurate comparison and interpretation of results is to ensure that the treatment group is representative across factors such as health status, age, and ethnicity, and and is similar along these dimensions as the control group. This way, we can attribute any differences in outcome to the treatment rather than differences in covariates. In a general study, it is upon the researchers' discretion to determine which features to be careful about.

- An approach that addresses the three points above is called the **Randomized Controlled Trial (RCT)** .


## Randomized Controlled Trials (RCT)

A Randomized Controlled Trial (RCT) is an experimental design in which treatments are assigned at random.

We start with a large enough set of individuals (or “units"), divide them randomly into a treatment group and a control group. (In the language of experimental design, each distinguishable individual for which membership in the treatment or control group can be uniquely decided is called a unit.)

The treatment is applied to the treatment units, while the control units are either simply set aside for observation or are given a placebo treatment. Then, by the Law of Large Numbers, we will expect the difference in averages of any relevant feature between the two groups to be fairly small. This allows us take the difference of the mean of the outcome variables in the two groups in order to estimate the treatment effect.

RCTs are very common in medicine to evaluate a new medical product, such as a drug or a vaccine. The simplest case of an RCT is a drug trial, where patients for a particular disease are randomly assigned to the treatment or the control group. The patients in a treatment group receive the new drug being studied, while those in the control group receive a placebo drug. This placebo drug can either be an existing standard treatment or a drug with no medical effect (for example, a sugar pill). Then, we can later compare the outcomes of the patients who received the new drug as compared to those who received the placebo drug.

**Stratification in a randomized control trial**

One common modification to a RCT is to use **stratification** . Here, we pre-divide the population into groups and then sample proportionately from each group. This allows us to not leave the unbiasedness of our sampling, with regards to a particular classification or feature, up to chance. Stratification also enables **subgroup** analysis , which is analyzing the treatment effect within a particular group.

In the drug trial scenario, a common stratification will be done by splitting patients into groups according to certain demographic categories. This is due to there being a difference in many physiological functions across groups of different age, gender, or race. The randomized assignment can then be done within each group, which allows for valid inference both within each subgroup or as a whole by aggregating the results across groups.

**Sample size concerns**

In subgroup analyses, and in RCT's where our sample is small, however, we wil likely run into sample size issues, which could affect the precision of the estimate. When we are only sampling a small number of points, it is more likely for us to either hit a large number of consecutively large or consecutively small points, as compared to when our sample is large. Thus, a particular difference in outcome means will in some sense mean less in a small sample. We need a relatively large sample to detect a treatment effect that is small.

## Ethical and human considerations in a study

In a study, we have to be careful about human factors because overlooking these can cause biases in the whole experiment. Such biases can cause lapses in the causal reasoning which can invalidate the statistical conclusions of a study. In the academic peer review process, whether the proposed methodology addresses such biases is carefully reviewed. Besides methodological concerns, ethical considerations will also guide the choice of procedures performed throughout a study.

**Double blindness**

In any experiment that involves human subjects, factors related to human behavior may influence the outcome, obscuring treatment effects. For example, if patients in a drug trial are made aware that they actually received the new treatment pill, their behavior may change in a number of ways, such as by being more or less careful with their health-related choices. Such changes are very difficult to model, so we seek to minimize their effect as much as possible.

The standard way to resolve this is through a double-blind study , also called a blinded experiment . Here, human subjects are prevented from knowing whether they are in the treatment or control groups. At the same time, whoever is in charge of the experiment and anyone else who could interact with the patient are also prevented from directly knowing whether a patient is in the treatment or the control group. This is to prevent a variety of cognitive biases such as observer bias or confirmation bias that could influence the experiment.

In some cases, it is impossible to ensure that a study is completely double-blind. In the mammography study, for example, patients will definitely know whether they received a mammography. If we modify the treatment instead to whether a patient is offered mammography (which they could decline), then we neither have nor want double-blindness. Here, the patient's decision regarding whether to take the mammography once offered, and his/her subsequent behavior, is part of the causal effect that we are assessing.

**Ethical considerations and consent**

In this example, it is partly due to ethical considerations that we decided on our treatment to be whether a patient is offered mammography, rather than performing a mammography itself. Suppose, however, we are intent on assess the causal effect of actually performing the mammography. Then one option is to perform a large number of mammographies and then randomly discarding half of them (without any further action).

However, this option is ethically questionable, since giving half of the patients possibly false information about their breast cancer risk is dangerous. Every study involving human subjects has related ethical considerations, and all such research are subject to review by an appropriate review board.

In addition, consent is a major component in modern ethical standards, meaning that it is required for those in the study to understand its parameters and agree to its terms. Anyone involved as a subject in an experiment or study should be informed of its risks and possible consequences. (For example, see this reference guide about consent in an experimental study.)


## Randomization

A randomized control trial (RCT) allows us to identify the causal effect by ensuring that in expectation, the treatment and control group are identically distributed in terms of any relevant feature (or any feature, for that matter). The mammography study is such an example. Here, we can take a large sample of 62,000 adult women who are enrolled in a particular insurance plan, and offer 31,000 of them a mammography (the treatment) and do not offer the remaining 31,000 (the control).

Depending on the pair of treatment and outcome variables, it may not be possible to use an RCT to identify the causal effect. Suppose a researcher wishes to evaluate the effect of smoking on lung cancer incidence. We cannot directly change the person's behavior with regards to smoking, so we cannot formulate a RCT for this causal effect. However, if we tweak the treatment to be something that we can assign and thus randomize, such as whether one is given advice on the dangers of smoking, then this time we can assess the causal effect.

In situations where randomization is impossible, our best option is an observational study, where we attempt to estimate a causal effect from existing data. For example, when studying the effects of particular genes in humans, editing genes is considered unethical and hence not done. There are methods such as instrumental variables that allows us to use the causal effect from one treatment to estimate another relationship that we are more interested in. These methods, however, are out of scope for this course. (The course 14.310x Data Analysis for Social Scientists gives a fairly detailed overview of this technique.)

## Observational study: confounding and control variables 

Now, what could we do if randomization is not feasible? This means that methods-wise, we are limited to an observational study , where the researchers do not apply any treatment but rather only observe them. The complication in this scenario that it is unlikely for this treatment to be randomized.

**Confounding variables**

As the treatment is not randomized, we are unable to assess the causal effect by taking a difference in means. A bias in the difference in means arises when, even without any treatment, the units that are more likely to be treated have a different baseline outcome than the units that are less likely to be treated. As a result, we are unable to discern whether the difference is from the treatment's effect or from a difference in baseline values. This phenomenon is called confounding , and any external variable that can be identified to influence both the treatment and the outcome variables is called a confounding variable .

The stratification approach discussed earlier is a possible remedy to this. If the confounding variable is a demographic category, then balancing the treatment variable within each category resolves the issue. In the smoking example, a confounding variable is that people who are older both smoke more and are more susceptible to lung cancer. Then, sampling an equal number of smokers and non-smokers within each age group corrects for this confounding variable.

**Use of control variables**

The use of control variables is another fix to this issue. The study of control variables in the context of causality is complex, so we give a brief overview of what makes an appropriate control variable. In an ideal setting, we select controls that will capture all possible sources of bias, factors that lead to both the treatment and outcome values. Most studies will only identify a subset of these sources, however. After identifying the controls, there are a whole array of techniques to account for their effects, the most common of which is multivariate regression.

For example, consider a study that investigates the effect of years of education on income at age 30. We expect someone from a well-off family to stay in school longer for many reasons, one of which is the high cost of higher education. At the same time, one's socioeconomic status while growing up affects future income for reasons unrelated to education, such as through higher expectations and better informal networks. Thus, family income is an appropriate control.

**Control variable pitfalls and causality**

Next, we consider what could make a control variable inappropriate. Consider a study that investigates the effect of smoking on stroke incidence, as discussed in the video. Then, suppose hospitalization is proposed as a control variable, meaning that, for example, we conduct the observational study with patients in a particular hospital as our sample. This time, the control may in fact introduce bias, because both smoking and stroke can cause hospitalization, the former, albeit more indirectly. This will negatively bias the estimated relationship, because if we condition on hospitalized patients, the effect of one cause will crowd out the effect of the other.


## Initial data analysis and causal effect identification

**Experiment Setup**

Let's first recap the experimental design for the HIP study. The population is the set of 700,000 female enrollees in the insurance program. For this experiment, 62,000 women were selected randomly and split into two groups: 31,000 in the control and 31,000 in the treatment groups. Those in the control group receive the standard healthcare as part of the insurance plan, while those in the treatment group in addition are offered four free mammographies (breast cancer screens) a year for five years; if anything abnormal were detected, she got early treatment. She could also choose to reject the screening.

**Examining Results**

In this experiment, 10,800 women rejected the screening while rest of 20,200 women accepted the screening. The main quantity of interest for each group is the death rate from breast cancer in the five years of follow-up. The number in each group and the rate are shown in the third column of the table, under the label "Breast cancer." Aside from this rate, the study also took note of the death rate from all other causes aside from breast cancer. This is similarly shown in the fourth column of the table. Later on, we will discuss why this statistic is also important.

How do we use the results from the table? If we want to show that being in the treatment group has an effect on reducing deaths due to breast cancer, then we clearly have to compare the death rate between this group and the control. To counter-check, however, we have to argue that the two groups are similar enough in terms of risk factors related to mortality. Indeed, if the rate of death from all other causes, as seen in the fourth column, is much higher in one group than another, then this is evidence that there may be a substantial difference. This difference may lead to different base rates of breast cancer deaths, which in turn make a direct comparison of the death rate inaccurate.

**Using other metrics in the table to assess a comparison**

The fourth column of the chart shows us why the only appropriate comparison is the full ( Total )  Treatment  group with the  Control  group. The death rates due to all other cases are  27  and  28  per 1000, which are not very far. On the other hand, a common error is to compare the  Screened  and the  Control . For these two groups, the  All other  death rates are  21  and  28  per 1000 respectively, which are significantly further apart. (For now, we are using a subjective judgement to decide on whether the  All other  death rates are significantly different. The methods in the following videos will apply to this as well.)

What causes the large difference in the rates of  All other  causes of death between the  Screened  group and the  Control  group? It is likely that conditional on being offered the screenings, whether a patient accepted the screenings or not gives information about their mortality rates. For example, those who accepted the mammography may tend to care more about their health and hence are less likely to die of other natural causes. It could also be that those already undergoing treatment for another disease will refuse due to possible complications.

In short, we want there to be no distinguishing factor between the groups we compare.

**Causal Effect Identification and Calculation**

Finally, we calculate the causal effect and also more precisely define what it represents. This is an intention-to-treat analysis, which focuses on the intention of offering a treatment rather than the actual treatment itself. In such an analysis, we compare the whole treatment group (everyone offered) against the whole control group.

From the table, we can get the following figures:

Death rate from breast cancer in control group: 0.00203 ( =6331000 )

Death rate from breast cancer in treatment group: 0.00126 ( =3931000 )

Hence, we can estimate the treatment effect to of offering mammography to be the difference in death rates:  0.00203−0.00126=0.00077 , or around  0.77  deaths per 1000.

## Statistical models: POisson model

**Poisson Distribution**

The Poisson random variable is based on taking the limit of a binomial distribution with a fixed mean  𝑛𝑝 . As we take  𝑛→∞ , the distribution converges to a fixed discrete pmf which we parameterize by  𝜆=𝑛𝑝 . Indeed, we can compute the probability of  𝑘  successes, substitute  𝑝=𝜆/𝑛 , and then take the limit.

 	 lim𝑛→∞(𝑛𝑘)𝑝𝑘(1−𝑝)𝑛−𝑘 	 =lim𝑛→∞𝑛!𝑘!(𝑛−𝑘)!𝑝𝑘(1−𝑝)𝑛−𝑘 	 	 
 	 	 =lim𝑛→∞𝑛(𝑛−1)…(𝑛−𝑘+1)𝑘!(𝜆𝑛)𝑘(1−(𝜆𝑛))𝑛−𝑘 	 	 
 	 	 =lim𝑛→∞𝑛(𝑛−1)…(𝑛−𝑘+1)𝑛𝑘𝑛𝑘𝑘!𝜆𝑘𝑛𝑘(1−(𝜆𝑛))𝑛−𝑘 	 	 
 	 	 =lim𝑛→∞(𝑛(𝑛−1)…(𝑛−𝑘+1)𝑛𝑘)𝜆𝑘𝑘!(1−(𝜆𝑛))𝑛−𝑘 	 	 
 	 	 =(1)𝜆𝑘𝑘!𝑒−𝜆=𝑒−𝜆𝜆𝑘𝑘!. 	 	 
Therefore, when data follows binomial distribution with large  𝑛  (number of trials) and small  𝑝  (probability of success), Poisson( 𝑛𝑝 ) is a good approximation to Binomial( 𝑛,𝑝 ).

Another interpretation of the Poisson random variable is in terms of a random process called the Poisson process. This is defined as a process where events can occur at any time in continuous time, with an average rate given by the parameter  𝜆  and satisfying the following conditions:

Events occur independently of each other.

The probability that an event occurs in a given length of time is constant.

**Application of the Poisson distribution**

We again consider the mammography study. In the control group, there are  31000  patients and we estimated the probability of each patient dying from breast cancer to be  0.00203 .

Let  𝑛=31000  be number of independent Bernoulli trials and  𝑝=0.00203  be a constant probability of breast cancer death. We can then approximate the number of deaths as Poisson, under the following assumptions:

One individual's death from breast cancer is independent from every other individual's death from breast cancer.

The probability that a death occur in a five year window does not change over time.

Binomial(31000,𝑝)  is well-approximated by  Poisson(31000𝑝) , which is justified by  Binomial(31000,0.00203)  has a large  𝑛  and a small  𝑝 .

From the approximation definition, the plot of the pmf of Poisson( 63 ) is thus very similar to the plot of the pdf of Binomial(31000,  𝑝 ).

## Hypothesis Testing: Introduction

**Motivation for hypothesis testing**

Going back to the HIP mammography study, recall that we are interested to find out whether offering a mammography for early detection reduces deaths due to breast cancer. This is an intent-to-treat analysis, where the treatment variable is whether a patient is offered mammography, as this is what is relevant for policy purposes. From the study with  31000  patients in each of the control and treatment groups, data is collected and summarized in the table below.

We can see that the death rate per  1000  women due to breast cancer goes down from  2.0  in the control group to  1.3  in the treatment group. While this is a sizeable reduction, due to variance in different datasets, it may be the case that this reduction happened just by chance. Indeed, it is possible that if we are to repeat the study, the control group may now have a higher death rate. The role of hypothesis testing is to assess how significant the change was in the death rate.

**Hypothesis testing and modelling overview**

A high-level summary of hypothesis testing is that it involves calculating the probability, under a given model, that an observation equal to or more extreme than what is observed in the treatment group is obtained, conditioned on the treatment having no effect. In the mammography study, we wish to calculate the probability that the treatment group has an observed death rate of  0.0013  or below, assuming that each patient in the treatment group has the same probability of death as in the control group.

The role of a statistical model is in calculating this probability. Without a model and its corresponding assumptions, we cannot determine how likely a particular observation in the treatment group is. In the mammography study, we use a Bernoulli model for the individual deaths, with the additional assumption that the deaths are independent and identically distributed. A Bernoulli model has a parameter, which we call  𝜋  in the this application. We can thus write the model, on the individual level, as

𝑋1,𝑋2,…,𝑋31000∼i.i.dBernoulli(𝜋). 
 


In this example, we use the Poisson approximation of the sum of independent Bernoulli random variables, and the parameter  𝜆  for the Poisson approximation is based on the sum of the expected values of the Bernoulli r.v.'s. Since there are  31000  of them, each with parameter  𝜋 , the parameter is then  𝜆=31000𝜋 . Hence, we can model the total number of deaths due to breast cancer in the treatment group as

𝑌=𝑋1+𝑋2+…+𝑋31000∼Poisson(31000𝜋). 
 

**Null and alternative hypotheses**

Now, we formalize and generalize the hypothesis testing setup. We define two contrasting statements that together summarize the hypothesis testing objective. They are the null hypothesis and the alternative hypothesis . In a treatment-control experimental setting, they take on the following roles:

- Null hypothesis  𝐻0 : claim that the treatment does not have a significant effect on the outcome, also known as the status-quo.

- Alternative hypothesis  𝐻𝐴 : claim that the treatment does have a significant effect on the outcome.

When we have a parameteric statistical model,  𝐻0  and  𝐻𝐴  can be formulated in terms of restrictions on the parameter. Indeed, in the mammography study, we can formulate the two contrasting claims on whether mammography is effective. This formulation is based on comparing the parameter  𝜋  in the treatment group to the estimated parameter of  0.00203  in the control group.

- Null hypothesis  𝐻0 :  𝜋=0.00203  (or equivalently,  𝜆=63 ), implying that offering mammography did not affect the breast cancer death rate

- Alternative hypothesis  𝐻𝐴 :  𝜋<0.00203  (or equivalently,  𝜆<63 ), implying that offering mammography had the effect of decreasing the breast cancer death rate.

In general, if we have a parametric statistical model with parameter  𝜃 , the null and alternative hypotheses are expressed as claims that the parameter is in sets  Θ0  and  Θ𝐴  respectively. These two sets are assumed to be disjoint, but their union need not be equivalent to the whole parameter space. We do not impose this last requirement because the focus of hypothesis testing is to compare which of the two hypotheses is more likely to be the case, and we may ignore parameter values that are outside our scope of interest.

## Hypothesis testing: test statistic, significance level, and p-value

Now, we describe the procedure of hypothesis testing, given a statistical model and a pair of null and alternative hypotheses.

**Hypothesis testing and the test statistic**

Hypothesis testing involves distinguishing between the null hypothesis and the alternative hypothesis. Under the null hypothesis, we have a baseline distribution (or set of distributions) of the observation from the model and the corresponding parameter(s). Based on the observation, we decide whether or not to reject the null hypothesis.

We reject the null hypothesis if we deem it relatively unlikely for the null hypothesis to be true, given the observations.

We fail to reject the null hypothesis if we do not have sufficient evidence from the observation to discredit the null hypothesis.

Notice the asymmetry between the two hypotheses. The conclusion from hypothesis testing is whether or not the null hypothesis is rejected. This results from the formulation of the null hypothesis being the status quo. If we decide to reject the null hypothesis, then the findings from the experiment as a whole is called significant .

The decision whether to reject the null hypothesis is based on a test statistic . The test statistic is a function of the random variables modelling the data. Hence it is a random variable itself, and its distribution depends on the parameters defining the model. For any specific hypothesis test, the test statistic that we choose needs to distinguish between the null and the alternative hypotheses, and have a distribution that is known and computable.

In the mammography example, we choose the test statistic  𝑌=𝑋1+𝑋2+…+𝑋31000 , the number of deaths due to breast cancer in the treatment group. We expect  𝑌  to take a smaller value under the alternative hypothesis  𝐻𝐴:𝜋<0.00203  than the null hypothesis  𝐻0:𝜋=0.00203 , so it will allow us to distinguish between the two. We also know the distribution of  𝑌 .

**Significance level**

We will use the distribution of the test statistic under the null hypothesis to answer the following question:

"Assuming that the null hypothesis is true, how likely is it for the test statistic to be at least as extreme (in the direction of the alternative hypothesis) as the one we have computed?"

To answer this question in the mammography example, we compute the probability of the test statistic  𝑌  taking a more extreme value than the observed value  39 , under the null  𝐻0:𝜋=0.00203 . Under the Poisson approximation, this is the probability of  𝑌≤39  under the model  𝑌∼Poisson(63) .

In the general hypothesis testing framework, we will then reject the null hypothesis if this probability is small enough, since this implies that if the null hypothesis is true, a test statistic as extreme as what we had observed is very unlikely. The significance level  𝛼  refers to this probability threshold. In many applications,  𝛼=0.05  is used.


## Hypothesis testing: p-value

**Significance level and the p-value**

Recall that hypothesis testing is based on the probability that the test statistic takes on its current value or a more extreme one, assuming that the null hypothesis  𝐻0  is true. This probability is defined as the p-value. From the definition of the significance level, another intrepretation is that the  𝑝 -value is the smallest significance level  𝛼  such that we will reject the null hypothesis.

In other words, the  𝑝 -value measures the "compatibilty" of the observed data with the null hypothesis. The lower the P value, the less likely such data will be observed given the null hypothesis. Thus, the null hypothesis will be less convincing compared to the alternative hypothesis and we are more likely to reject it.

The  𝑝 -value can be calculated by summing up or integrating values along the tail of the test statistic pmf/pdf towards the direction of the alternative hypothesis.

The  𝑝 -value is always between  0  and  1  and depends on the model. In the mammography study, the binomial model gives a slightly higher  𝑝 -value (0.0012) than when the Poisson approximation is used (0.0008). In the exercise below, we will apply the concept of the  𝑝 -value to the mammography study.

## Hypothesis testing errors and power of a test

**Type I error and type II error**

Hypothesis testing is an uncertain process due to inherent variation in the observations. There is thus the possibility of having the wrong conclusion, called error. The two types of error are as follows:

- Type I error (false positive): We reject  𝐻0  (equivalently, find the result significant) when  𝐻0  is actually true. In the mammography study, it is concluding that offering mammography decreases the likelihood of breast cancer death even if it actually does not.

- Type II error (false negative) : We do not reject  𝐻0  (equivalent, find the result not significant) when  𝐻𝐴  is actually true. In the mammography study, it is not concluding that offering mammography decreases the likelihood of breast cancer death when it actually does.

The two types of errors are shown in the off-diagonal entries in the matrix below. Note that the diagonal entries refer to a correct conclusion of either correctly rejecting or failing to reject the null hypothesis  𝐻0  in favor of the alternative hypothesis  𝐻𝐴 .


We note that the significance level is in fact the probability of a type I error. Thus, setting the significance level to  𝛼  is equivalent to allowing this level of type I error to occur.

**Power of a test**

A related concept is the power of a test, which is defined as the probability of rejecting  𝐻0  when  𝐻𝐴  is true, i.e. the probability of correctly rejecting the null hypothesis. In other words, Power = 1 -  𝐏 (Type II error).

The simplest case to discuss the power of a test is when we have a simple hypothesis test, which is when the test is parametric and both the null and the alternative hypotheses consist of a single parameter value. In the mammography study, we can for example have the following hypotheses on the parameter  𝜋 .

- Null Hypothesis  𝐻0 :  𝜋=0.002  (blue distribution on the right)

- Alternative Hypothesis  𝐻𝐴 :  𝜋=0.0013  (orange distribution on the left)

The distribution of the test statistic under the null and the alternative hypotheses are shown in the plot below. The blue distribution on the right corresponds to the null hypothesis  𝐻0 , while the orange distribution on the left corresponds to the alternative hypothesis  𝐻𝐴 .


We reject  𝐻0  if our sample has a  𝑝 -value less than  𝛼=0.05 , i.e. any value on the  𝑥 -axis to the left of the vertical line separating the colored from the non-colored regions. The power is then the area to the left of this line that is under the curve given  𝐻𝐴  (the left curve), i.e. the area of the orange and blue regions combined.

## Hypothesis testing trade-offs

This video discusses the trade-offs faced in hypothesis testing. In summary,

- There is a direct tradeoff between reducing the type I and type II errors. In nearly all cases, with a fixed test statistic, reducing the type I error results into increasing the type II error, and vice versa.

- Keeping the significance level constant, a one-sided hypothesis test has a higher power than the corresponding two-sided hypothesis test. An exception is when the distribution of the observation under the alternative hypothesis is bimodal.





