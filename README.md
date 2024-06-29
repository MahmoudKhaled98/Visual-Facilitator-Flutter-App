<h1 align="center">Visual Facilitator Flutter App</h1>

<p align="center">
  A mobile application designed to assist visually impaired individuals, using Flutter with Clean Architecture and BLoC for state management.
</p>

## Features

- **Egyptian Currency**: Recognizes 5, 10, 20 pounds, etc.
- **Colors**: Identifies different colors.
- **Text**: Reads and vocalizes text.
- **Location**: Provides current geographical information.
- **Fruits**: Detects various types of fruits.
- **Vegetables**: Recognizes different vegetables.
- **Kitchen Tools**: Identifies common kitchen utensils.
- **Vehicles**: Detects various types of vehicles.

## How It Works

1. **User Interface**:
    - Eight buttons for different detection functions.

2. **Feature Usage**:
    - **Currency, Colors, Text, Fruits, Vegetables, Kitchen Tools, Vehicles**:
        - Activates the camera for item identification.
        - Displays and reads results aloud.
    - **Location**:
        - Provides geographical details without using the camera.

## Architecture

### Clean Architecture

- **Presentation Layer**: UI and user interactions.
- **Domain Layer**: Business logic and rules.
- **Data Layer**: Data operations and external service integration.

### BLoC (Business Logic Component)

- Manages state changes in response to user inputs and data updates.
- Ensures separation of concerns for easier testing and debugging.

## Technologies Used

- **Flutter**: Cross-platform mobile application framework.
- **BLoC**: State management.
- **TFLite**: On-device machine learning with TensorFlow Lite.

## Packages

- `cupertino_icons: ^1.0.6`: Icons for iOS design.
- `camera: ^0.10.6`: Access to the device camera.
- `tflite_v2: ^1.0.0`: TensorFlow Lite support.
- `geolocator: ^10.1.0`: Geolocation capabilities.
- `geocoding: ^2.1.1`: Address lookup.
- `equatable: ^2.0.5`: Simplifies equality comparisons.
- `permission_handler: ^11.0.1`: Manages permissions.
- `palette_generator: ^0.3.3+3`: Extracts color palettes from images.
- `path_provider: ^2.1.3`: Access to file system paths.
- `flutter_tesseract_ocr: ^0.4.24`: Optical Character Recognition (OCR).

## Directory Structure

```plaintext
/visual_facilitator
│
├── /lib
│   ├── /presentation
│   ├── /domain
│   ├── /data
│   └── (other Flutter files)
│
├── /script
│   └── model_generator.py (Python script for TFLite model)
│
└── other project files...
```
## Directory Structure
- **1**: Clone the repository:
```plaintext
git clone https://github.com/yourusername/visual-facilitator.git
cd visual-facilitator

```

- **2**: Install dependencies:
```plaintext
flutter pub get
```

- **3**: Run the application:
```plaintext
flutter run
```

## Contributing

- **1**: Fork the repository.
- **2**: Create a new branch.
- **3**: Make your changes.
- **4**: Submit a pull request.

## Contributing
- For any questions or feedback, please contact mahmoud.khaled.hanfy@gmail.com.
