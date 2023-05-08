from flask import Flask
from flask_restx import Api
from apis.login import login_api
from apis.board import board_api
from apis.real_estate import real_estate_api
from apis.agents import agents_api

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

api.add_namespace(login_api)
api.add_namespace(board_api)
api.add_namespace(real_estate_api)
api.add_namespace(agents_api)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5050)
