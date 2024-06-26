#!/bin/bash

# Step 1: Run the Jupyter Notebook
jupyter nbconvert --to notebook --execute baseline_model_nyc_taxi_data.ipynb --output executed_notebook.ipynb

# Step 2: Execute the Python script
python evidently_metrics.py