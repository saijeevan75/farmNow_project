from flask import Flask, request, jsonify
import pickle

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

if __name__ == '__main__':
    app.run(debug=True)




