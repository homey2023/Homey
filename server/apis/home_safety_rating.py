# apis/home_safety_rating.py
"""
This module defines the Flask-RestX resources for the Home Safety Rating API.

The Home Safety Rating API provides resources for fetching safety-related data 
based on geographical location and for performing safety rating calculations 
and anomaly detection on that data.
"""

import os
import sys
from flask import request
from flask import jsonify
from flask_restx import Namespace, Resource
sys.path.append(os.path.dirname(os.path.abspath(os.path.dirname(__file__))))
from dataloader.dataloader import count_place  # Update the import statement
import numpy as np

home_safety_rating_api = Namespace('home_safety_rating')

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

        Returns:
        A JSON object mapping safety feature types to boolean values indicating 
        whether an anomaly was detected for each feature.
        """
        # Get latitude and longitude from the query parameters
        latitude = float(request.args.get('latitude'))
        longitude = float(request.args.get('longitude'))
        
        # Call the dataloader function
        result = count_place(latitude, longitude)
        
        # Detect anomalies
        counts = np.array(list(result.values()))
        mean = counts.mean()
        std = counts.std()
        anomalies = (np.abs(counts - mean) > 2 * std).tolist()
        
        return {"anomalies": anomalies}
