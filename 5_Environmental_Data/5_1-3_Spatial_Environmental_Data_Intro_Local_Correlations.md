## Objectives

- Develop basic intuition and context about the sources and types of environmental data.
- Understand flow data and generate dynamic simulations based on flows.
- Learn the concept of correlation in space.
- Recall a number of basic definitions from random processes related to Gaussian random variables: e.g., covariance, correlation, independence.
- Compute conditional distributions in jointly Gaussian random variables.
- Construct covariance matrices based on kernel functions.

## Introduction
In this module, we focus on environmental data. In particular, we strengthen our understanding of correlation of information from measurements of environmental variables. Recall, that from an information theoretic perspective, correlation between random variables indicate some form of "linear relation" or correspondence between two sources of data. We will formalize these definitions later on. Correlations are particularly important in various forms of environmental data, for example, the temperatures of two nearby cities might be correlated, and thus, information from one of them can help us infer information from the other and vice-versa. This is particularly important when some of the variables we are interested in are not readily available for our analysis, and instead, we have access to some other correlated information. Apart from temperature measurements, what other types of environmental data can you think about?

Note that in the previous exercise, we differentiate the concept of variable, and data. This is an important distinction for data analysis. For example, we one might be interested in measuring Pollution levels, however, it is required to have a formal definition of the concept of pollution in terms of environmental variables that we can measure. When talking about air quality, micrograms per cubic meter of pollutants in the air is a common measurement, or parts per million. This is the initial connection between the object we are interested in: pollution, air quality, ozone, etc, and a variable we can generate measurements from. Another rather interesting example in a clear difference between the object of interest and the variables is on biodiversity measurements. For many years, ant populations have been used to measure and monitor biodiversity. Once a variable is defined as a proxy for the object of interest, we refer to **data** as the measurements obtained from that variables. These are usually characterized by some quantitative information, like a number, and some meta-data corresponding to spatial and temporal information of the measurements.

From the point of view of environmental data, there are many other related variables that one might be interested in, for example:

- Predicting animal populations: Usually, animal populations serve as indicator of healthy ecosystems.

- Predicting disease: Environmental data can provide contextual information about disease spreading. For example, how temperature changes and rainy seasons impact the spread of malaria in the tropics.

- Renewable energy predictions: Clear understanding of wind speeds, water levels in damps, or underground thermal activity provide information for renewable energy decisions.

- Predicting extreme events: extreme events like storms and floods are usually modeled and predicted to incorporate action plans.

- Policy making: for example pollution concentrations measurements in the air can help the design of guidelines for industry contaminants.

What type of common characteristics would you find in environmental data?

- Seasonality (correlation in time): Some variables like temperature, or weather systems in general have some temporal patterns. For example, seasons, or rain/drought times.

- Space relations, or spatial correlations: Under the assumption that some of the variables that we are interested in have some from of smooth behaviour, one might expect that the physical distance between two points induces or is an indication that the date generated at those points have some relation between them.

- Continuous changes: Continuity or smoothness is a special assumption for environmental data, where we suppose that the variables will not have sudden changes that generate abrupt data discontinuities.

Weather is a classic example of a dynamical system from which one can measure a number of variables to generate environmental data, see the above figure. One can obtain physical and chemical models for such processes to understand parts of such systems. This allows us to use data generated from first-principles simulations. Moreover, one can observe the seasonality, spatial relations, and continuity of the generated data.

The below figure is a clear example of seasonality or temporal correlations in data. In this case, we observed ozone levels in Boston in 2016. A pattern is recognized: periodically, the levels go up and down, which corresponds to yearly variations.


The below figure shows the temperature measurements for two towns in Québec. Assuming some proximity in these two towns, some correlation is expected and observed in the data. However, around 1962 there is a discontinuity in the measurements. By data observations only, this will imply a sudden decrease in the temperature of Sherbrooke, is this possible under some continuity assumptions? A more mundane reason explains such change. The station that was taking such measurements was moved from the inner to the outer city. As expected, the temperature outside the city is lower. This leads us also to consider context as well as new phenomena that can be present in data. Taking into account such possibly unknown dynamics is a part of environmental data analysis, as different sensors will have different biases and each measurement needs to be individually calibrated.

From the examples above, we can conclude a number of common characteristics about environmental data

- Correlations in time: temporal patterns such a seasons.
- Correlations in space: linear dependencies or relations between variables measured at close-by locations.

In the next section, we switch gears and focus on one particular form of environmental data, namely, flow data. This will be useful for the homework problems!



