
# Map Translations

Map Translations is a machine learning project designed to perform image-to-image translation between satellite images and Google Maps-style images. This is achieved using a Generative Adversarial Network (GAN), specifically a conditional GAN (cGAN). The project integrates deep learning with a Flutter-based frontend, providing a user-friendly interface for generating and exploring translated maps.

## Problem Statement

The goal of this project is to develop a cGAN-based solution for converting satellite images into map-style images and vice versa. This has practical applications in geospatial data visualization, urban planning, and navigation.

## Features

- **Image-to-Image Translation:** Generate Google Maps-style images from satellite images and vice versa.
- **Interactive Frontend:** A Flutter application for easy access to the model's functionalities.
- **Firebase Integration:** User authentication and secure storage of generated images and user details.
- **API Integration:** Backend model predictions are served using FastAPI.
- **High-Resolution Outputs:** High-quality TIFF images are generated and managed using QGIS.

## Tech Stack

- **Backend:**
  - Generative Adversarial Network (cGAN) for training and predictions.
  - FastAPI for model integration and API endpoints.
  - Firebase for user authentication and database management.
- **Frontend:** Flutter for cross-platform application development.
- **Geospatial Tools:** QGIS for creating and processing high-resolution images.
- **Deployment:** Ngrok for securely exposing local APIs to the internet.

## Dataset

The project uses the [Pix2Pix dataset](https://phillipi.github.io/pix2pix/) for training and evaluation:
- **Data Description:**
  - 1096 image pairs of satellite and map images.
  - Grayscale images with a resolution of 256x256 pixels.
  - Labeled maps indicating land use, vegetation, urban areas, and water bodies.
- **Dataset Split:** Training (1096 pairs) and validation (100 pairs).

## Model Architecture

The cGAN consists of:
- **Generator:** An encoder-decoder architecture with skip connections for improved spatial consistency.
- **Discriminator:** A binary classifier to distinguish real from generated images, providing feedback to the generator.

### Training and Optimization

- **Loss Functions:** Binary Cross-Entropy Loss and Mean Absolute Error Loss.
- **Training Strategy:** Alternate training of generator and discriminator for optimal results.

## Application Workflow

1. **Frontend Interface:**
   - Users log in or sign up through Firebase authentication.
   - Select the type of map translation needed (satellite-to-map or map-to-satellite).
   - View previously generated translations.

2. **Backend Predictions:**
   - Input images are sent to the FastAPI backend.
   - The model predicts and returns the translated images.
   - Results are stored securely in Firebase.

3. **High-Resolution Images:**
   - QGIS generates high-resolution TIFF images.
   - These are processed and broken into smaller parts for predictions.
   - Outputs are stitched back to form complete high-resolution images.

4. **Deployment:**
   - The FastAPI backend is exposed to the internet using Ngrok for seamless integration.

## Installation

### Prerequisites
- Python 3.8+
- Flutter SDK
- Firebase account
- TensorFlow/Keras
- QGIS

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/shriya-1603/Map_Translation.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Map_Translation
   ```
3. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```
4. Set up Flutter:
   ```bash
   flutter pub get
   ```
5. Configure Firebase for authentication and database storage.
6. Run the application:
   - Start the Flutter app using:
     ```bash
     flutter run
     ```
   - Start the FastAPI backend:
     ```bash
     uvicorn main:app --reload
     ```

## Results and Predictions

- **Generated Outputs:** High-quality map and satellite translations.
- **Performance Metrics:** Evaluated using validation images for accuracy and visual fidelity.
- **Applications:** Improved geospatial visualization, urban planning, and user-centric navigation tools.

## Acknowledgements

- Pix2Pix dataset and framework.
- Tools like QGIS, FastAPI, and Firebase for enabling seamless development and deployment.
