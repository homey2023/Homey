# apis/survey.py
"""
This module defines the Flask-RestX resources for the Home Safety Rating API.

The Home Safety Rating API provides resources for fetching safety-related data 
based on geographical location and for performing safety rating calculations 
and anomaly detection on that data.
"""
from flask_restx import Namespace, Resource
from flask import request
from flask import jsonify
import db_config
from pymongo.mongo_client import MongoClient

inquiry = db_config.inquiry


inquiry_api = Namespace(
    name='Inquiry',
    description='API for saving inquiry results'
)


@inquiry_api.route('/saveInquiry')
class Saving(Resource):
    def post(self):
        result = {}
        result['authCode'] = str(request.form['authCode'])
        result['inquiry_message'] = str(request.form['inquiry_message'])

        try: 
           
           inquiry.insert_one(jsonify(result))

           return "success"
        
        except Exception as e:
            
            return e
        