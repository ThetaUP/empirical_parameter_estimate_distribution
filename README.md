# empirical parameter estimate distribution
This repostiory is about the topic of a master thesis of Jakub Liu under the supervision of dr hab. inż. Tomasz Suchocki.

## introduction
The problem of overfitting is an omnipresent hurdle in the development of predictive models in statistics and artificial intelligence.
If this topic where to be summarized in one sentence, it would be that the models which suffer from a to good fit to the training data, which implies
a uderperformace on unseen (testing) data. Varius approaches like, k-fold cross-validation, regularization and early stopping (just to name a few), have been proposed
to countermend this phenomenon. This thesis aims to explore the properties of a new approach, which is based on the creation of empirical distributions of model parameter
estimates and then drawing estimates from that distribution.

## approach description
For simplicity, the method will be described in the context of simple linear regression of the form yi = β0 + β1xi + ϵ
### unidimensional estimate distributions
Consider a dataset with n observations and p explanatory variables:
| p=1  | ... | p=p  |
|------|-----|------|
| X1,1 | ... | X1,p |
| X2,1 | ... | X2,p |
| ...  | ... | ...  |
| Xn,1 | ... | Xn,p |

The approach can be summarized in the following steps.
1. create m bootstrap samples (with replacement) of the original data
    - each bootstrap sample will have the same dimensions as the original data
2. for each bootstrap sample fit a model (in our case simple linear regression)
3. add the β0 estimate and the β1 estimate to their corresponding arrays
4. calculate the means and standard deviations of the two arrays, by this we get:
    - μβ0, μβ1
    - σβ0, σβ1
5. draw the final β0 and β1 estimates from their respective normal distributions with the following parameters
    - ~N(μβ0,σβ0*α)
    - ~N(μβ1,σβ1*α)
      * note that the α parameter is a hyperparameter which aims to either increase or decrease the variance of the empirical distributions
6. build a final predictive model with the parameter estimates from step 5.)
The hope is that the final model from step 6.) will exhibit a lower prediction error on previously unseen data, compared a standard linear
regression model.

### multivariate estimate distribution
This approach is highly similar to the univariate approach with one key difference. We don't estimate the distributions of the parameters
as independent unidimensional distributions, but model it as a d-dimensional normal, where d is the number of parameter estimates. In our exemplary
case of simple linear regression, the d-dimensional normal is a 2-dimensional normal distribution, due to the fact that we have 2 parameters (β0, β1)
to estimate. More formally, based on the β0 and β1 arrays (that come from the m bootstrap samples), we calculate the sample covariance matrix ∑, which
is the 2nd (after the vector of means) parameter of the 2-dimensional normal distribution.

