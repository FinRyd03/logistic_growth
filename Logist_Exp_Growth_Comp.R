library(ggplot2)

growth_data <- read.csv("experiment.csv")

##Extracting coefficients
data_subset1 <- growth_data %>% filter(t < 1000) %>% mutate(N_log = log(N))
model1 <- lm(N_log ~ t, data_subset1)
data_subset2 <- growth_data %>% filter(t > 3000)
model2 <- lm(N ~ 1, data_subset2)
coefficients_mod1 <- coef(model1)
coefficients_mod2 <- coef(model2)

##Parameters
t <- 4980
N0 <- 879
r <- coefficients_mod1[2]
K <- coefficients_mod2[1]

logistic_fun <- function(t) {
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  return(N)
}

exp_fun <- function(t) {
  N <- (N0*exp(r*t))
  return(N)
}

ggplot(aes(t,N), data = growth_data) +
  geom_point() +
  geom_function(fun=logistic_fun, colour = "red") +
  geom_function(fun=exp_fun, colour = "blue") + 
  geom_label(aes(x = 3000, y = 6*10^10, label = "Logistic"), colour = "red") +
  geom_label(aes(x = 1800, y = 7*10^10, label = "Exponential"), colour = "blue") +
  labs(title = "Exponential & Logistic Growth Curves",
       x = "Time / t",
       y = "Population Size / N") +
  coord_cartesian(ylim = c(0, 8*10^10))



