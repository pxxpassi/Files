import cv2
import numpy as np
import time
import requests

cap = cv2.VideoCapture(0)

# Replace with your Flask server URL
flask_server_url = "http://127.0.0.1:5000/detect_sign_language"

while True:
    success, img = cap.read()
    imgOutput = img.copy()

    # Your existing code for hand detection, cropping, and resizing

    _, img_encoded = cv2.imencode('.jpg', imgWhite)
    img_bytes = img_encoded.tobytes()

    # Send the image to the Flask server
    response = requests.post(flask_server_url, data=img_bytes)

    if response.status_code == 200:
        # Decode the response and get the translated result
        result = response.json()
        translation = result.get('result', 'N/A')

        # Display the translation on the image
        cv2.putText(imgOutput, translation, (x_min + 10, y_min - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 255, 255), 2)

    cv2.imshow("Image", imgOutput)

    key = cv2.waitKey(1)
    if key == ord("s"):
        # Your existing code for capturing images
        counter += 1
        cv2.imwrite(f'{folder}/Image_{time.time()}.jpg', imgWhite)
        print(counter)
    elif key == ord("q"):  # Press 'q' key to exit the loop
        break

cap.release()
cv2.destroyAllWindows()
