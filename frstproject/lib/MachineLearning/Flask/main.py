from flask import Flask, request, jsonify
import pickle
import numpy as np
# Load the trained model
with open('CropRecommendation.pkl', 'rb') as f:
    model = pickle.load(f)

# Initialize the Flask application
app = Flask(__name__)

# Define the endpoint for making predictions
@app.route('/recommend', methods=['POST'])
def predict():
    # Extract the request data
    data = request.get_json(force=True)

    # Convert the data into a 2D NumPy array
    X = [[data['N'], data['P'], data['K'], data['temperature'], data['humidity'], data['ph'], data['rainfall']]]

    # Make a prediction using the loaded model
    y_pred = model.predict(X)

    # Return the predicted output as a JSON response
    return jsonify({'prediction': y_pred.tolist()})


    # n = request.form.get('N')
    # p = request.form.get('P')
    # k = request.form.get('K')
    # temperature = request.form.get('temperature')
    # humidity = request.form.get('humidity')
    # ph = request.form.get('ph')
    # rainfall = request.form.get('rainfall')
    # input_query = np.array([[n,p,k,temperature,humidity,ph,rainfall]])

    # result = model.predict(input_query)[0]


    # return jsonify({'label':result})



if __name__ == '__main__':
    app.run(debug=True)


