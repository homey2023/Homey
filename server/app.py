from flask import Flask, request
from flask_restx import Api, Resource, fields, Namespace
from pymongo.mongo_client import MongoClient
from pymongo.server_api import ServerApi
import config 
from apis.login import login_api
from apis.board import board_api
from apis.real_estate import real_estate_api
from apis.agents import agents_api
from apis.home_safety_rating import home_safety_rating_api 

app = Flask(__name__)
api = Api(
    app,
    version='0.1',
    title="Homey API",
    description="Homey API Server!",
    terms_url="/",
    contact="seungjaelim@kaist.ac.kr",
    license="MIT"
)
USER_NAME = config.MONGODB_USERNAME
PASSWORD = config.MONGODB_PASSWORD

client = MongoClient(f'mondogb://{USER_NAME}:{PASSWORD}@43.202.53.29', 27017)
#db = client.

'''
uri = f"mongodb+srv://{getattr(config, 'MONGODB_USERNAME')}:{getattr(config, 'MONGODB_PASSWORD')}@{getattr(config, 'MONGODB_CLUSTER')}.mongodb.net/?retryWrites=true&w=majority"
# Create a MongoClient object using the configuration variables
client = MongoClient(uri, server_api=ServerApi('1'))

# Access your MongoDB Atlas database and collection using the client object
db = client.my_database
real_estate_collection = db.real_estate
agents_collection = db.agents
'''
api.add_namespace(login_api)
api.add_namespace(board_api)
api.add_namespace(real_estate_api)
api.add_namespace(agents_api)
api.add_namespace(home_safety_rating_api)

if __name__ == "__main__":
    # Send a ping to confirm a successful connection
    try:
        # client.admin.command('ping')
        print("Pinged your deployment. You successfully connected to MongoDB!")
    except Exception as e:
        print(e)
    app.run(debug=True, host='0.0.0.0', port=5050)
    