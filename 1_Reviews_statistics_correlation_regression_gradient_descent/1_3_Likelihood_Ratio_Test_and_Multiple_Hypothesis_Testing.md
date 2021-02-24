## Objectives

At the end of this lecture, you will be able to

- Apply the Likelihood Ratio Test on the HIP mammography experiment and other similar scenarios.

- Define family-wise error rate (FWER) and false discovery rate (FDR) for a series of hypothesis tests and choose which of these to control in different scenarios of multiple hypothesis tests.

- Compute  𝑝 -value corrections such as the Bonferroni correction and Holm-Bonferroni correction , to control the family-wise error rate (FWER).

- Compute  𝑝 -value corrections such as the Benjamini-Hochberg correction method to control the false discovery rate (FDR).



## Metrics for false significance

Video Note: In the video above, at 12:35, when Prof Uhler computed

𝐄[𝑉]=𝑚0(𝛼𝑚)
 
, she used that 𝑉 follows a binomial distribution, which is true only if the tests were independent. The equation above in fact follows even without independence, as Prof Uhler mentioned later in the video, since 𝐄[𝑉]=∑𝑚0𝑖=1𝐄[Ψ𝑖]=𝑚0(𝛼𝑚) where Ψ𝑖 is the indicator variable, with 𝐏(Ψ𝑖=1)=𝛼𝑚, to indicate that Test 𝑖 is found to be significant.

Review: Type I and Type II errors

Recall that

type 1 Error is the error of rejecting 𝐻0 when 𝐻0 is true.

The significance level 𝛼 is the the probability of making a Type 1 error.

A type 2 Error is the error of failing to reject 𝐻0 when 𝐻𝐴 is true.

The power is the probability of not making a type 2 error, or equivalently the probability of correctly rejecting 𝐻0 when 𝐻𝐴 is true.

Hide

When testing one hypothesis, the main error that we control is the error of making a false discovery, i.e. the type I error of rejecting the status quo even though it is true. We control this by setting the significance level 𝛼=𝐏(reject 𝐻0|𝐻0true) to be a small value (typically 0.05).

When performing multiple hypothesis tests, setting the significance level for all tests to be some fixed 𝛼 (independent of the number of tests) may not be enough to control false significance. For example, setting 𝛼=0.05 for each test means that the expected number of false discoveries is 5% of the total number of the tests for which the null hypotheses are true. So the number of false discoveries may be large, especially when a large number of tests are performed.

Instead, in the setting of multiple testing, we can control the two following metrics for false significance:

Family-wise error rate (FWER) : the probability of making at least one false discovery, or type I error;

False discovery rate (FDR) : the expected fraction of false significance results among all false significance results.

Family-wise error rate (FWER)

For a series of tests in which the 𝑖th test uses a null hypothesis 𝐻𝑖0, let the total number of each type of outcome be as follows:


Then the family-wise error rate (FWER) is the probability of making at least one false discovery, or type I error;

 	FWER=𝐏(𝑉≥1).	 	 
where 𝑉 is the total number of type I errors as in the table above, i.e., 𝑉=∑𝑚0𝑖=1Ψ𝑖 where {Ψ𝑖} is the set of 𝑚0 tests for which 𝐻0 is true.

In scenarios in which any false claims of discovery may lead to serious consequences, such as for drug approval, we want to control FWER.

FWER with no corrections

Recall from the lecture the paired test in which treatment effects are measured on 100 variables for 1000 people, and the treatment itself is a placebo (of being given water). If we perform 𝑚 independent tests each at significant level 𝛼, then the FWER is

 	FWER=𝐏(𝑉≥1)=1−𝐏(𝑉=0)=1−(1−𝛼)𝑚≈1for large 𝑚.	 	 
In other words, if we set the significance level of each test without taking into account the large number of tests performed, it is highly likely that the series of tests will lead to at least one false discovery. This often leads to puzzling claims such as water has treatment effect on important health parameters, or eating pizza reduces the risk of cancer.