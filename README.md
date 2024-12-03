# R scripts for reproductible analysis of logistic growth

1. For the logistic growth model, the following results were obtained:
   $N\scriptsize{0}$ = 879
   $r$ = 1.004e-02
   $K$ = 6.000e+10
Data to construct the model was obtained from the file `'experiment.csv'`. $N\scriptsize{0}$ represents the initial population size, and can be found using `head(growth_data)` denoting the intial population size. Two separate models, of the exponential growth phase and the saturation phase were produced named `model1` and `model2` respectively. Running `summary()` of both models indicated the $r$ and $K$ values. $r$ (the intrinsic rate of growth) was determined by finding the gradient of the linear model, and $K$ (the carry capacity) was determined by finding the y-intercept of the model. To find the maximum $r$ value, the `filter()` function was used from the `dplyr` package to construct the model from $0<t<1000$. Similarly, the maximum $K$ value was determined using the same packages, applying a threshold of $t>3000$. This ensures that the results of the diminshing growth phase don't skew the models and offset $r$ and $K$ values.


2. The following calculations can be carried out to determine population size at $t=4980$ under the $N\scriptsize{0}$ and $r$ values listed in Q1, assuming exponential growth: 

   $N(t) = N_0e^{rt}$ T

   The parameters can be inputted to yield the result:

   $N(t) = 879e^{1.004e^{-02}*4980} \approx 4.55 \times 10^{24}$
   
   Similarly, using the same values, the predicted population size can be calculated using values listed in Q1 using the logistic growth model using the following equation: 

   $N(t) = \frac{K}{1 + (\frac{K - N_0}{N_0})e^{-rt}}$

   The parameters can then be inputted to yield the result: 

   $N(t) = \frac{6.000e+10}{1 + (\frac{6.000e+10 - 879}{879})e^{-1.004e-02*4980}} \approx 6.00 \times 10^{10}$

   The population size at `t=4980` under exponential growth is $\approx 75.9$ trillion times higher than the population size under logistic growth. This is because the result of the logistic growth curve is constrained by a maximum carrying capacity $K$, whilst the result of the exponential is not constrained and continues to increase at the intrinsic growth rate $r$


3. RScript in file `Logist_Exp_Growth_Comp.R`, and graph image in file `Logist_Exp_Curves.png`
