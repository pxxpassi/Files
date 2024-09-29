from flask import Flask, request, jsonify
from flask_cors import CORS
import cv2
import numpy as np
import isl_interpreter

app = Flask(__name__)
CORS(app)

# Configuration
MODEL_PATH = "C:/Users/Purvi/Desktop/SLI project/Agnethon_TeraByte-main/Agnethon_TeraByte-main/Model2/keras_model.h5"
LABELS_PATH = "C:/Users/Purvi/Desktop/SLI project/Agnethon_TeraByte-main/Agnethon_TeraByte-main/Model2/labels.txt"

# Initialize the custom sign language detector
sign_language_detector = isl_interpreter(MODEL_PATH, LABELS_PATH)

@app.route('/detect_sign_language', methods=['POST'])
def detect_sign_language():
    """
    Detects sign language in an image.

    Returns:
    - JSON: A JSON response containing the result of sign language detection.
    """
    try:
        # Get the image data from the request
        img_bytes = request.data

        # Decode the image from bytes
        nparr = np.frombuffer(img_bytes, np.uint8)
        img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

        # Assuming your CustomSignLanguageDetector.detect method returns a result
        detection_result = sign_language_detector.detect(img)

        # TODO: Add your translation logic here based on the detection result

        # Example response
        result = {'result': f'Translation for {detection_result}'}
        return jsonify(result)

    except Exception as e:
        error_message = f'Error during sign language detection: {str(e)}'
        print(error_message)
        result = {'result': error_message}
        return jsonify(result)

if __name__ == "__main__":
    # Use HTTPS in development for secure data transmission
    app.run(debug=True, ssl_context='adhoc')
