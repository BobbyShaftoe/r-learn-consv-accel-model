# Value
# An object of the class explainer.
# It’s a list with following fields:
#   • model the explained model
# • data the dataset used for training
# • y response for observations from data
# 6 feature_response
# • y_hat calculated predictions
# • residuals calculated residuals
# • predict_function function that may be used for model predictions, shall return a single
# numerical value for each observation.
# • residual_function function that returns residuals, shall return a single numerical value for
# each observation.
# • class class/classes of a model
# Examples

# simple explainer for regression problem
aps_lm_model4 <- lm(m2.price ~., data = apartments)
aps_lm_explainer4 <- explain(aps_lm_model4, data = apartments, label = "model_4v")
aps_lm_explainer4
# various parameters for the explain function
# all defaults
aps_lm <- explain(aps_lm_model4)
# silent execution
aps_lm <- explain(aps_lm_model4, verbose = FALSE)
# user provided predict_function
aps_lm <- explain(aps_lm_model4, data = apartments, label = "model_4v", predict_function = predict)
# set target variable
aps_lm <- explain(aps_lm_model4, data = apartments, label = "model_4v", y = apartments$m2.price)
aps_lm <- explain(aps_lm_model4, data = apartments, label = "model_4v", y = apartments$m2.price,
                  predict_function = predict)


## Not run:
# more complex model
library("randomForest")

# aps_rf_model4 <- randomForest(m2.price ~., data = apartments)
# aps_rf_explainer4 <- explain(aps_rf_model4, data = apartments, label = "model_rf")
# aps_rf_explainer4
## End(Not run)