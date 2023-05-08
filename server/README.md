# Homey Server

This is the backend server for Homey, a real estate application.

## Installation

To install the server, follow these steps:

1. Clone the repository:

```
git clone https://github.com/<your-github-username>/homey-server.git
cd homey-server
```


2. Create a new conda environment using the `environment.yml` file:

```
conda env create -f environment.yml
```


This will create a new environment called `homey`.

3. Modify the `config.py` file with your MongoDB Atlas configuration information.

4. Activate the conda environment:

```
conda activate homey
```


5. Start the server:

```
python app.py
```

The server should now be running at `http://localhost:5050`.

## Usage

The server provides several RESTful endpoints for interacting with the Homey application:

- `/login` - Login to the Homey application
- `/board` - View and post messages on the Homey bulletin board
- `/real-estate` - View, add, update, and delete real estate listings
- `/agents` - View, add, update, and delete real estate agents

## Contributing

If you would like to contribute to the development of Homey Server, please follow these steps:

1. Fork the repository on GitHub
2. Create a new branch for your changes
3. Make your changes and commit them
4. Push your changes to your fork
5. Submit a pull request to the main repository

## License

Homey Server is licensed under the MIT License. See LICENSE for more information.
