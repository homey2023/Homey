from deepod.models.icl import ICL
from deepod.models.dif import DeepIsolationForest
from deepod.models.slad import SLAD
import os
import numpy as np
import pandas as pd

def prepare_data():
    df = pd.read_csv('./data/train.csv')
    df = df.drop(['latitude', 'longitude'], axis=1)
    X_train = df.values.astype(np.float32)
    return X_train

def fit_model(X_train, model, save_path):
    model.fit(X_train, save_path=save_path)
    return model

def compute_scores(model, X_test):
    return model.decision_function(X_test)

def main():
    random_state = 42
    X_train = prepare_data()
    X_test = np.array([0.0898021308980213,0.14678899082568808,0.0,0.0,0.3333333333333333,0.0,0.0,0.16666666666666666])

    models = {
        'icl': ICL(),
        'dif': DeepIsolationForest(),
        'slad': SLAD(),
    }
    
    save_paths = {
        'icl': './weight/icl.pt',
        'dif': './weight/dif.pt',
        'slad': './weight/slad.pt',
    }

    for model_name, model in models.items():
        print(f"Fitting model: {model_name}")
        fit_model(X_train, model, save_paths[model_name])
        scores = compute_scores(model, X_test)
        print(f"Scores for {model_name}: {scores}")

if __name__ == '__main__':
    main()
