# apis/home_safety_rating.py
"""
This module defines the Flask-RestX resources for the Home Safety Rating API.

The Home Safety Rating API provides resources for fetching safety-related data 
based on geographical location and for performing safety rating calculations 
and anomaly detection on that data.
"""

import os
import sys
import pickle
from flask import request
from flask import jsonify
from flask_restx import Namespace, Resource
from deepod.models.icl import ICL
from deepod.models.dif import DeepIsolationForest
from deepod.models.slad import SLAD

sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from dataloader.dataloader import count_place  # Update the import statement
import numpy as np

home_safety_rating_api = Namespace('home_safety_rating')

models = {
    'icl': ICL(),
    'dif': DeepIsolationForest(),
    'slad': SLAD(),
}

def get_model(model_name):
    try:
        model = models[model_name]
        model.load_state_dict(torch.load(f'./weight/{model_name}.pt'))
    except KeyError:
        model = models['icl']
        model.load_state_dict(torch.load('./weight/icl.pt'))
    return model

def load_scaler(feature):
    with open(f'./weight/scaler_{feature}.pkl', 'rb') as f:
        return pickle.load(f)
    
@home_safety_rating_api.route('/count')
class Count(Resource):
    """
    Count resource for the Home Safety Rating API.

    Provides the count of various safety-related features around a specific 
    geographical location.
    """
    def get(self):
        """
            Fetch the count of safety-related features for a specific location.

            Query Parameters:
            latitude -- the latitude of the location
            longitude -- the longitude of the location

            Returns:
            A JSON object mapping safety feature types to their respective counts.
        """
        # Get latitude and longitude from the query parameters
        latitude = float(request.args.get('latitude'))
        longitude = float(request.args.get('longitude'))
        
        # Call the dataloader function
        result = count_place(latitude, longitude)
        return jsonify(result)

@home_safety_rating_api.route('/rating')
class Rating(Resource):
    """
    Rating resource for the Home Safety Rating API.

    Provides a safety rating for a specific geographical location, 
    based on the count of various safety-related features around that location.
    """
    def get(self):
        """
        Fetch the safety rating for a specific location.

        Query Parameters:
        latitude -- the latitude of the location
        longitude -- the longitude of the location

        Returns:
        A JSON object containing the safety rating.
        """
        # Get latitude and longitude from the query parameters
        latitude = float(request.args.get('latitude'))
        longitude = float(request.args.get('longitude'))
        
        # Call the dataloader function
        result = count_place(latitude, longitude)
        
        # Calculate the rating
        counts = list(result.values())
        rating = sum(counts) / len(counts) if counts else 0
        
        return {"rating": rating}

@home_safety_rating_api.route('/anomaly')
class Anomaly(Resource):
    """
    Anomaly resource for the Home Safety Rating API.

    Provides an anomaly detection for a specific geographical location, 
    based on the count of various safety-related features around that location.
    """
    def get(self):
        """
        Detect anomalies in the safety-related feature counts for a specific location.

        Query Parameters:
        latitude -- the latitude of the location
        longitude -- the longitude of the location
        model -- the model to use for anomaly detection (optional)

        Returns:
        A JSON object mapping safety feature types to boolean values indicating 
        whether an anomaly was detected for each feature.
        """
        # Get latitude, longitude, and model from the query parameters
        latitude = float(request.args.get('latitude'))
        longitude = float(request.args.get('longitude'))
        model_name = request.args.get('model')
        
        # Call the dataloader function
        result = count_place(latitude, longitude)
        
        # Load the scalers and scale the data
        counts = np.array([load_scaler(feature).transform([[count]]) for feature, count in result.items()]).reshape(1, -1)
        
        # Get the model and detect anomalies
        model = get_model(model_name)
        anomalies = model.decision_function(counts)
        
        return {"anomalies": anomalies.tolist()}
    