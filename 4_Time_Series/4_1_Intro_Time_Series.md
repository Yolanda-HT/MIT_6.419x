## Objectives

At the end of the is lecture, you should be able to

- Understand the definition of time series.
- Understand the definition of stationary and non-stationary time series.
- Understand the relationship and difference between weak and strong stationarity.
- For a given time series data, plot it and identify the trend and seasonality.
- Use appropriate methods to remove the trend and seasonality.
- Use ACF as a diagnostic tool to study the dependence structure of a time series.


*Where do time series come up?*
- Economics, finance (stock market)
- Social sciences (birth rate over time)
- Epidemiology (spread of infectious disease, coupled with space)
- fMRI / neuroscience
- Environmental sciences (weather, pollution)
- Speech analysis


## What are time series
A time series is a special kind of statistical data, specifically, it is a collection of numerical measurements, called observations

𝑥1,…,𝑥𝑡,…,𝑥𝑛∈ℝ
 
that are indexed by a time stamp 𝑡=1,…,𝑛. These time stamps must form a *deterministic sequence and be regularly spaced* in time with equal intervals between any two adjacent stamps. For the purposes of statistical inferences with these data, the observations are modeled mathematically as realizations of a corresponding series (i.e., sequence) of random variables

𝑋1,…,𝑋𝑡,…,𝑋𝑛:Ω→ℝ
 
that are defined on some common probability space (Ω,𝐏). As with other types of statistical data, what is observed by the statistician is a particular outcome of a specialized probability model:

𝑥1=𝑋1(𝜔),…,𝑥𝑡=𝑋𝑡(𝜔),…,𝑥𝑛=𝑋𝑛(𝜔),
 
for an outcome 𝜔∈Ω in some probability space (Ω,𝐏).

The probability model is such that we have one random variable for each time stamp and one observation for each random variable. All these random variables are defined on a common probability space, so we can speak of probabilities of joint events that involve any number of these random variables. The realizations come from the real world where they occur sequentially in time in the order of the time stamp index 𝑡, so that 𝑥𝑡 is observed before 𝑥𝑡+1. Also, the observations arrive at a fixed time interval, so that the time that elapses between observing 𝑥𝑡 and 𝑥𝑡+1 is the same for all 𝑡.


## Dependence in timeseries

The most important feature of time series data is that we make no assumption about independence of these random variables. Recall that **independence** was our fundamental assumption in the context of cross-section data that are obtained by random sampling from a fixed population, which we studied in e.g. 18.6501x. In fact, most time series data are **dependent**, typically because past realizations influence future observations through the nature of the real world phenomenon that produces these data. It is fair to say, that the main goal of time-series analysis is to first model and then estimate from data (guided by the model) the dependence structure of these random variables.

Statistical dependence in a time series is a double-edged sword. On the one hand, dependence **helps** us make predictions about the future realizations from knowledge of the past realizations. E.g., if yesterday was warm, today will probably be warm as well. On the other hand, dependence poses technical challenges in the distributional analysis of estimators. This is because there is effectively less statistical information in dependent data about the data generating process, as compared to the case of independent observations. E.g., the basic laws of large numbers and central limit theorems do not even apply!

To gain some intuition for our discussion of time series, consider the following examples:

- Economic data: stock prices, inflation rate, GDP, employment rate, interest rate, exchange rates;
- Biometric data: heart rate, blood pressure, weight, fMRI;
- Environmental data: temperature, precipitation, pressure, humidity, pollution;
- Sound data: speech, music;

In all these examples, as well as in a general time series, data take the form of **discrete** measurements of a real world phenomena that evolves **continuously** in time. A general probabilistic model to describe such phenomena is called a **stochastic process**, which is simply a collection of random variables {𝑋𝑡} indexed by either a continuous or discrete time parameter 𝑡. So, a time series data set can be thought of as a **single realization** of a stochastic process. Each random variable 𝑋𝑡 has a marginal distribution P𝑡. The process {𝑋𝑡}𝑡>0 as a whole also has a probability law, which can be thought of as the joint distribution of all the 𝑋𝑡's. Interestingly, this joint distribution of the entire process, whether continuous or discrete, is completely characterized by the collection of all the finite-dimensional marginal distributions P𝑡1,..,𝑡𝑘 of random vectors (𝑋𝑡1,…,𝑋𝑡𝑘) where 𝑘 ranges over all integers and time indexes 𝑡1,…,𝑡𝑘 range over all distinct time stamps.

## Deterministic dependencies in time series: trend, seasonality

Some of the main characteristics of dependence in a time series are a trend and seasonal variation . These are deterministic dependencies of the random variables 𝑋𝑡 of our series on the time stamp 𝑡.

To be a bit more precise, think about the regression of the time series on the time index. Let
𝜇𝑋(𝑡):=𝐄[𝑋𝑡]
 
denote the mean function of the marginal distributions of the series (i.e. of each distinct 𝑋𝑡 in the series). The marginal mean function 𝜇𝑋(𝑡) contains both the trend and the seasonal variation of the series, it is a function of time, possibly nonlinear. 
- The trend of the series, denoted 𝑚𝑋(𝑡), is the non-constant and non-cyclical component of 𝜇𝑋(𝑡). Trend can be linear or nonlinear, and is often monotone in time. 
- The seasonal variation of the series, denoted 𝑠𝑋(𝑡), is the cyclical component of 𝜇𝑋(𝑡). It is a periodic function whose values repeat at a fixed time interval. The period of seasonal variation may be assumed known or unknown depending on the data and application.

Thus we have the following decomposition of the deterministic dependence structure:
𝜇𝑋(𝑡)=𝑚𝑋(𝑡)+𝑠𝑋(𝑡).

*Examples of deterministic dependence, trend and seasonal variation.*
Each set of figures in the problems below contains several realizations of the same time series model. Each line (plotted in a unique color to make it easier to read the figure) represents one outcome of the time series model, called a **sample path**. Three sub-figures of each exercise illustrate the effect of varying the level of noise parameters of the model.


## Introduction to Stochastic dependence

The main stochastic feature of time series data is the statistical **dependence** of the random variables at different time points. Mathematically, statistical dependence of a collection of random variables means that *their joint distribution is not equal to the product of their marginal distributions*. Recall also the intuitive definition of independence of random variables 𝑋𝑠 and 𝑋𝑡 from 6.431x: If we know that event {𝑋𝑠=𝑥} has occurred, we can form a conditional probability model 𝐏𝑡|𝑋𝑠 for 𝑋𝑡. Random variables 𝑋𝑠 and 𝑋𝑡 are independent if this conditional model is exactly the same as the unconditional model where we are uncertain about the values of both random variables. In other words, information about 𝑋𝑠 does not change our beliefs about the likelihood of different values of 𝑋𝑡. Dependence means that by conditioning on 𝑋𝑠, we obtain a probability distribution for 𝑋𝑡 that is different from the marginal distribution 𝐏𝑡. That is, knowledge that event {𝑋𝑠=𝑥} has occurred, provides information about the likelihood of different values of 𝑋𝑡.

**Examples:**
Recall our examples of time series and decide if 𝑋𝑡 and 𝑋𝑡+1 are dependent or independent.

- Economic data: stock prices (dependent), inflation rate (dependent), GDP (dependent), employment rate (dependent), interest rate (dependent), exchange rates (dependent);
- Biometric data: heart rate (dependent), blood pressure (dependent), weight (dependent), fMRI (dependent);
- Environmental data: temperature (dependent), precipitation (dependent), pressure (dependent), humidity (dependent), pollution (dependent);
- Sound data: speech (dependent), music (dependent);

All these time series are composed of **dependent** random variables. For example, the price of a stock tomorrow maybe above or below the price of this stock today, and our expectation is that it will be equal to the price today. Because markets are efficient, the best forecast of the price tomorrow is the price today. In other words, the change in the price between today and tomorrow is completely random and independent of the price today. But the sum of the price today with this change (the price tomorrow) obviously depends on the price today.

Many of the time series above also exhibit deterministic dependence. For instance, heart rate is periodic, temperature has seasonal variations with a twelve months period.

Very often it is the case that time series observations that are close to each other in time are strongly correlated. For some time series this correlation decays as the time distance between observations increases, while the variation of 𝑋𝑡 stays constant over time. For other time series the correlation of 𝑋𝑡 with future observations stays constant, while the total variation of the series accumulates and increases with time. More precisely, 

- The **autocovariance** function of a time series 𝛾𝑋(𝑠,𝑡):=𝖢𝗈𝗏[𝑋𝑠,𝑋𝑡]=𝐄[(𝑋𝑠−𝜇𝑋(𝑠))(𝑋𝑡−𝜇𝑋(𝑡))],  describes the linear stochastic association between the terms of the series.

- The **marginal variance** function 𝛾𝑋(𝑡,𝑡):=𝖵𝖺𝗋[𝑋𝑡]=𝐄[(𝑋𝑡−𝜇𝑋(𝑡))2], describes the magnitude of the random fluctuations in the series at different time points. Realizations of time series with strong stochastic dependencies tend to look much smoother and more regular than the white noise process with the same marginal variance function.


## Objective of Time Series
The goal of time series analysis is to understand and exploit the deterministic and stochastic dependencies of the stochastic process that generated the data. Specifically, we want to develop statistical tools and models to

- Detect the trend 𝑚𝑋(𝑡);
- Detect seasonal variation 𝑠𝑋(𝑡) and determine its period length;
- Understand the correlation structure 𝛾𝑋(𝑡,𝑠) within the same time series;
- Understand the correlation structure between two different time series.

In many applications of time series analysis, the main objective is to forecast future observations of the series. This requires estimating the trend and the seasonal component and fitting a statistical model that captures the correlation structure between adjacent observations. We can then form a prediction of the future from the past by extrapolating on all the dependencies in the series that we learn from data with statistics. In some applications of time series these dependence properties are of interest on their own.

For example, macro economics studies the **business cycle** of expansions and contractions of the economy. One may ask, for example, how long was the previous business cycle? This requires removing the trend (long-term deterministic component) and seasonal variation (short-term deterministic component) and studying the remaining cyclical variation in the series.

**Examples of real data**
Real world time series contain some combination of deterministic and stochastic dependencies. In the two problems below, we will use our naked eye to detect these properties. One of the time series highlights the deterministic dependencies, while another time series exhibits stochastic dependencies.

## Stationarity

In order to do statistical estimation and inference with time series data, we need technical conditions about the stochastic process from which the data are drawn. The idea is to ensure that observations along a single realization of the process are representative of all possible realizations of the process that we will never get to see. Specifically, we need conditions that would allow us to estimate population parameters of the whole process (e.g. expectations, variances, correlations) with time averages over a single realization of the process. Also, we need conditions that would allow us to extrapolate statistical models fitted to observations from the past into the future.

In the statistics of cross-section data (e.g. regression analysis and maximum likelihood estimation that we studied in 18.6501x), we relied on random sampling (i.e., the i.i.d. assumption) to argue that sample averages are good estimators of the population averages in moderately large samples because of the LLN and CLT. Time series data are certainly not i.i.d. but the following definition enables one to do inference via time averages along a single sample path, while allowing for stochastic dependencies in the data:

Time series {𝑋𝑡}∞𝑡=−∞ is strongly stationary if the joint distribution of 𝑋𝑡,…,𝑋𝑡+𝑛 is the same as the joint distribution of 𝑋𝑡+ℎ,…,𝑋𝑡+𝑛+ℎ:

(𝑋𝑡,…,𝑋𝑡+𝑛)=(𝖽)(𝑋𝑡+ℎ,…,𝑋𝑡+𝑛+ℎ)
 
for all integers 𝑛, time stamps 𝑡 and time shifters ℎ. The notation above means equality in distribution: i.e., the probability distribution 𝐏𝑡,…,𝑡+𝑛 on ℝ𝑛 of the random vector (𝑋𝑡,…,𝑋𝑡+𝑛) is identical to the probability distribution 𝐏𝑡+ℎ,…,𝑡+ℎ+𝑛 of the random vector (𝑋𝑡+𝑛,…,𝑋𝑡+𝑛+ℎ). Recall that equality of distributions means that for any intervals 𝑎𝑠≤𝑏𝑠 we have the same probabilities of the series taking its values in these intervals:

 	 	𝐏{𝑋𝑡∈[𝑎1,𝑏1],…,𝑋𝑡+𝑠∈[𝑎𝑠,𝑏𝑠],…,𝑋𝑡+𝑛∈[𝑎𝑛,𝑏𝑛]}	 	 
 	 	=𝐏{𝑋𝑡+ℎ∈[𝑎1,𝑏1],…,𝑋𝑡+𝑠+ℎ∈[𝑎𝑠,𝑏𝑠],…,𝑋𝑡+𝑛+ℎ∈[𝑎𝑛,𝑏𝑛]}.	 	 
Weak stationarity of a time series {𝑋𝑡}∞𝑡=1 requires that only the first two moments of the series (i.e. the mean and variance/covariance) be constant in time:

 	𝐄[𝑋𝑡]=𝜇𝑋,𝖵𝖺𝗋(𝑋𝑡)=𝜎2𝑋,𝖢𝗈𝗏(𝑋𝑠,𝑋𝑡)=𝛾𝑋(|𝑠−𝑡|)	 	 
for all time stamps 𝑠,𝑡. A weakly stationary time series is often called simply stationary.

## Examples of stationarity and non-stationarity
We make three observations about the concept of stationarity. Think about how the examples in the lecture relate to these observations.

1. Stationarity requires that the joint distribution of the series remains fixed throughout time. This means that all the stochastic dependencies in the adjacent terms of the series remain the same throughout time. So, if we estimate a model based on observations from 𝑡=1,…,𝑛, then stationarity will allows us to use the fitted model to predict observations for 𝑡>𝑛. Strong stationarity also implies that the marginal distribution of each 𝑋𝑡 is the same for all 𝑡. This means that, despite lack of independent observations, we do have identically distributed observations that are dependent.

2. If, in addition to stationarity, the stochastic dependence in the terms of the series dies down sufficiently quickly as the time gap between observations increases, we can use these observations to do statistical estimation, by relying on appropriate generalizations of the LLN and the CLT. Intuitively, if the observations that are sufficiently far from each other in time are close to being independent, then the path sample averages behave similarly to the sample averages of i.i.d. random variables.

3. Stationarity rules out dependence of the series on the time index 𝑡, therefore rules out trends and seasonal variation.

For these intuitive and technical reasons, it will be important that we always work with stationary time series. Of course, many time series are not stationary. So the first step in any analysis of time series data is to transform the data in such a way as to produce a stationary series. This typically amounts to using regression methods or averaging techniques to remove the trend and seasonal variation components. Sometimes it may be necessary to apply a variance stabilizing transformation to the data.


## Estimation on stationary time series

Let 𝑋𝑡 denote a stationary time series. Recall that this implies that the marginal mean function 𝜇𝑋(𝑡) is constant and the autocovariance function depends only on the difference of the two time stamps. We obtain estimators of the mean 𝜇𝑋, the variance 𝜎2𝑋 and the autocovariance function 𝛾𝑋(ℎ) by replacing expectations with sample averages:


 	𝜇̂ 	=𝑋¯𝑛=1𝑛∑𝑡=1𝑛𝑋𝑡	 	 
 	𝜎̂ 2	=1𝑛∑𝑡=1𝑛(𝑋𝑡−𝜇̂ )2	 	 
 	𝛾̂ (ℎ)	=1𝑛∑𝑡=1𝑛−ℎ(𝑋𝑡−𝜇̂ )(𝑋𝑡+ℎ−𝜇̂ )for1≤ℎ<𝑛.	 


If the series is stationary, then each observation in the sample averages above contributes statistical information about the common parameters 𝜇,𝜎2,𝛾(ℎ). However, most time series are dependent. However, if the stochastic dependences (e.g. correlations) in the series decays sufficiently fast as the time distance between terms get large, then the sample averages have a similar asymptotic behavior as in the classical laws of large numbers and central limit theorems for i.i.d. data. So, under mild technical conditions, we have good estimators of the mean, variance and autocovariance function of a stationary time series.






