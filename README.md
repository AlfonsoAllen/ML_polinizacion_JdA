# ML_polinizacion_JdA

## Overview

This repository contains the code to obtain the results of the data-driven regression models for the technical report entitled "EVALUATION AND ASSESSMENT OF ECOSYSTEM SERVICES FOR POLLINATION" by Ignasi Bartomeus, Carlos Martinez-Nuñez, Alfonso Allen-Perkins, Elena Velado-Alonso.

## Data Sources

The data used includes:
- Validation point coordinates: `data/sites_validation_GEE_2019.csv`
- Coordinates for 2500 points in Andalusia: `data/sites_AAP2.csv`
- Features for ML models: `data/Features_JdA_validation_2019.csv`, `data/Features2.csv`.

Those features were extracted using Google Earth Engine, as described in the public repository [OBServ_Models_Open](https://github.com/garciagimenezangel/OBServ_Models_Open) 

## Generating Predictions

To generate predictions at the validation points using the different models in Giménez-García et al. (2023), run the following scripts:
- `code/Bayridge_predictions_for_ALL_JdA_sites_NO_MOSS.IPYNB`
- `code/GB_predictions_for_validation_sites.IPYNB`
- `code/SVR_predictions_for_validation_sites.IPYNB`

To generate predictions at the 2500 points across Andalusia, run:
- `code/Bayridge_predictions_for_ALL_JdA_sites_NO_MOSS.IPYNB`

## Visualization

To visualize the prediction results in R for both the validation points and all of Andalusia, run:
- `code/plot_global_validation_BayRidge.R`
- `code/plot_global.R`

## References

Giménez-García et al., 2023. "Pollination supply models from a local to global scale," *Web Ecology*, 23(2), pp. 99-129. [https://doi.org/10.5194/we-23-99-2023](https://doi.org/10.5194/we-23-99-2023).