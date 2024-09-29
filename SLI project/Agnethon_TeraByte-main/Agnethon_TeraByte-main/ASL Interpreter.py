import cv2
from cvzone.HandTrackingModule import HandDetector
from cvzone.ClassificationModule import Classifier
import numpy as np
import math
import time
import requests  # Import the requests library

cap = cv2.VideoCapture(0)
detector = HandDetector(maxHands=2, detectionCon=0.8)
classifier = Classifier("Model2/keras_model.h5", "Model2/labels.txt")
offset = 20
imgSize = 300
folder = "Data3/C"
counter = 0
labels = ["A", "B", "C", "D", "E", "F", "G"]

# Replace with your Flask server URL
flask_server_url = "http://localhost:5000/detect_sign_language"

while True:
    success, img = cap.read()
    imgOutput = img.copy()
    hands, img = detector.findHands(img)

    if hands:
        if len(hands) == 1:
            hand = hands[0]
        elif len(hands) == 2:
            # Combine information from both hands
            hand1, hand2 = hands
            # Calculate the bounding box that fits both hands
            x_min = min(hand1['bbox'][0], hand2['bbox'][0])
            y_min = min(hand1['bbox'][1], hand2['bbox'][1])
            x_max = max(hand1['bbox'][0] + hand1['bbox'][2], hand2['bbox'][0] + hand2['bbox'][2])
            y_max = max(hand1['bbox'][1] + hand1['bbox'][3], hand2['bbox'][1] + hand2['bbox'][3])

            # Draw the bounding box
            cv2.rectangle(imgOutput, (x_min, y_min), (x_max, y_max), (255, 0, 255), 4)

            # Use the combined bounding box to crop and process the image
            imgWhite = np.ones((imgSize, imgSize, 3), np.uint8) * 255
            imgCrop = img[y_min - offset:y_max + offset, x_min - offset:x_max + offset]
            imgCropShape = imgCrop.shape

            # Resize and place the cropped image in the center of imgWhite
            imgResize = cv2.resize(imgCrop, (imgSize, imgSize))
            imgWhite[:imgSize, :] = imgResize

            # Encode the image to bytes
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

                # Display the cropped and resized images
                cv2.imshow("ImageCrop", imgCrop)
                cv2.imshow("ImageWhite", imgWhite)

    cv2.imshow("Image", imgOutput)

    key = cv2.waitKey(1)
    if key == ord("s"):
        counter += 1
        cv2.imwrite(f'{folder}/Image_{time.time()}.jpg', imgWhite)
        print(counter)
    elif key == ord("q"):  # Press 'q' key to exit the loop
        break

cap.release()
cv2.destroyAllWindows()
