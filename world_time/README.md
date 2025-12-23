# 🌍 World Time

A beautiful Flutter application that displays the current time in different locations around the world. Features a stunning day/night theme that changes based on the local time of the selected location.

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

## ✨ Features

- 🌐 **40+ World Locations** - Cities across Africa, Americas, Asia, Europe, and Oceania
- 🔍 **Search Functionality** - Quickly find cities with real-time search
- 🌅 **Day/Night Theme** - Dynamic background that changes based on local time
- 🚩 **Flag Emojis** - Visual country flags for easy identification
- ⚡ **Fast & Responsive** - Clean architecture with optimized performance
- 🎨 **Beautiful UI** - Modern Material Design 3 with gradient backgrounds
- 🔄 **Error Handling** - Graceful error recovery with retry functionality

## 🏗️ Project Structure

```
lib/
├── main.dart                    # Entry point
├── app.dart                     # App configuration & routing
├── core/
│   ├── constants/
│   │   └── app_constants.dart   # App-wide constants
│   ├── theme/
│   │   └── app_theme.dart       # Theme configuration
│   └── utils/                   # Utility functions
├── features/
│   ├── data/
│   │   ├── models/
│   │   │   └── location_model.dart    # Location data model
│   │   └── services/
│   │       └── world_time_api.dart    # API service
│   └── presentation/
│       └── pages/
│           ├── loading.dart     # Splash/loading screen
│           ├── home.dart        # Main time display
│           └── choose_location.dart   # Location picker
└── shared/
    └── widgets/                 # Reusable widgets
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.x or later)
- Dart SDK (3.x or later)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Vinald/world_time.git
   cd world_time
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

| Package | Description |
|---------|-------------|
| [http](https://pub.dev/packages/http) | HTTP networking |
| [intl](https://pub.dev/packages/intl) | Date/time formatting |
| [flutter_spinkit](https://pub.dev/packages/flutter_spinkit) | Loading animations |

## 🌐 API

This app uses the [WorldTimeAPI](http://worldtimeapi.org/) - a simple web service that returns the current local time for a given timezone.

### API Endpoint
```
GET https://worldtimeapi.org/api/timezone/{timezone}
```

### Example Response
```json
{
  "datetime": "2024-01-15T10:30:45.123456+05:30",
  "utc_offset": "+05:30",
  "timezone": "Asia/Kolkata"
}
```

## 🎨 Theming

The app features a dynamic theme system:

- **Day Theme**: Sky blue gradient (6 AM - 8 PM local time)
- **Night Theme**: Purple/dark blue gradient (8 PM - 6 AM local time)

Colors are defined in `lib/core/theme/app_theme.dart` and can be easily customized.

## 🛠️ Architecture

The project follows a **feature-first** clean architecture approach:

- **Data Layer**: Models and API services
- **Presentation Layer**: UI pages and widgets
- **Core**: Shared utilities, constants, and themes

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📧 Contact

Vinald - [Read More Here](http://vinald.me)

Project Link: [https://github.com/Vinald/world_time](https://github.com/Vinald/world_time)
