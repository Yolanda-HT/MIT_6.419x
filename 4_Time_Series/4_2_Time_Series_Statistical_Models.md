## Objectives

At the end of the is lecture, you should be able to

- Understand the definition and property of white noise model, autoregressive model and random walk model.
- Understand the definition and property of moving average model and ARMA model.
- Fit autoregressive model to time series data and use Yule-Walker equation to estimate the coefficients.

## White noise process
The simplest time series model is the white noise process {𝑊𝑡}𝑡 of random variables that have zero mean, the same variance 𝜎2𝑊, and zero correlations:

 	𝜇𝑊(𝑡)	=𝐄[𝑊𝑡]=0	 	 
 	𝛾𝑊(𝑡,𝑡)	=𝖵𝖺𝗋(𝑋𝑡)=𝜎2𝑊	 	 
 	𝛾𝑊(𝑡,𝑠)	=𝖢𝗈𝗏(𝑋𝑡,𝑋𝑠)=0,for𝑡≠𝑠.	 


The white noise model is not very interesting. In particular, it has *no stochastic dependencies (correlations)*. The purpose of the white noise model is to *model the “best" case residuals that contain no information*, after we fit a good time series model to the data and subtract the fitted values for the data. That is, we will be completely satisfied with a time series model for a given dataset, if the residuals of that model contain no further information about the dependencies in the data. This would mean that our statistical model for the data captures all the stochastic dependence exhibited in the data, which we can harness for e.g., predicting future observation.

To detect a white noise time series, we first *check that the series is stationary* (e.g. by plotting it and making sure there is no trend or seasonal variation or exploding variance) and *then look at the autocovariance function to detect stochastic dependencies in the data*. Of course, we don't know the true autocovariance function of the process that generated the data and have to estimate it with 𝛾̂ 𝑊(ℎ). Under appropriate technical conditions, the distribution of the estimator is

𝛾̂ 𝑊(ℎ)∼𝑁(0,𝜎2𝑊𝑛)
 
which means that we do not expect to see the theoretical acf function exactly as our estimate, but only approximately up to estimation error.



