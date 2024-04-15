## Littlefish Flutter Technical Assessment

Welcome to my Littlefish Flutter Technical Assessment! Each project showcases different aspects of Flutter development, including state management, API integration, and plugin creation. Below is an overview of each project along with its structure and dependencies:

### Question 1: Counter Application (BLOC)

**Overview:**
A simple counter application demonstrating basic state management using BLOC architecture.

**Project Structure:**
- **main.dart:** Entry point of the application.
- **ui/welcome/welcome.dart:** Welcome screen.
- **ui/counter/counter.dart:** Counter screen.
- **state/bloc/counter_bloc.dart:** Manages counter state using BLOC pattern.

**Dependencies:**
- [Flutter](https://flutter.dev/)
- [material](https://api.flutter.dev/flutter/material/material-library.html)

### Question 2: Counter Application (Redux)

**Overview:**
A simple counter application demonstrating basic state management using Redux architecture.

**Project Structure:**
- **main.dart:** Entry point of the application.
- **ui/welcome/welcome.dart:** Welcome screen.
- **ui/counter/counter.dart:** Counter screen.
- **state/redux/actions.dart:** Defines actions.
- **state/redux/reducers.dart:** Reducer function.
- **state/redux/store.dart:** Redux store.

**Dependencies:**
- [Flutter](https://flutter.dev/)
- [redux](https://pub.dev/packages/redux)
- [flutter_redux](https://pub.dev/packages/flutter_redux)
- [material](https://api.flutter.dev/flutter/material/material-library.html)

### Question 3: Rick and Morty Characters Application

**Overview:**
An app to explore characters from the Rick and Morty universe using data from the [Rick and Morty API](https://rickandmortyapi.com/).

**Project Structure:**
- **main.dart:** Entry point of the application.
- **ui/welcome/welcome.dart:** Welcome screen.
- **ui/characters/characters.dart:** Character page.
- **providers/page_provider.dart:** Manages page state.
- **models/character_model.dart:** Model classes.

**Dependencies:**
- [Flutter](https://flutter.dev/)
- [http](https://pub.dev/packages/http)
- [provider](https://pub.dev/packages/provider)
- [material](https://api.flutter.dev/flutter/material/material-library.html)

### Question 4: Internet Connectivity Plugin

**Overview:**
A Flutter plugin to check device internet connectivity status.

**Dependencies:**
- [Flutter](https://flutter.dev/)
