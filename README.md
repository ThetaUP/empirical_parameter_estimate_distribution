<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.7/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# empirical parameter estimate distribution
This repostiory is about the topic of a master thesis of Jakub Liu under the supervision of dr hab. inż. Tomasz Suchocki.

## introduction
The problem of overfitting is an omnipresent hurdle in the development of predictive models in statistics and artificial intelligence.
If this topic where to be summarized in one sentence, it would be that the models which suffer from a to good fit to the training data, which implies
a uderperformace on unseen (testing) data. Varius approaches like, k-fold cross-validation, regularization and early stopping (just to name a few), have been proposed
to countermend this phenomenon. This thesis aims to explore the properties of a new approach, which is based on the creation of empirical distributions of model parameter
estimates and then drawing estimates from that distribution.

## approach description
For simplicity, the method will be described in the context of simple linear regression of the form \(y = beta0 + beta1x \)
### unidimensional estimate distributions

