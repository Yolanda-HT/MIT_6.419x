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