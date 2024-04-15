# Question 2 - Counter Application (Redux)

This Flutter project is a simple counter application that demonstrates basic state management using Redux architecture.

## Project Structure

- **main.dart:** Entry point of the application. It initializes the app and defines routes.
- **ui/welcome/welcome.dart:** Welcome screen displayed when the app starts. It displays a welcome message and a button to navigate to the counter screen.
- **ui/counter/counter.dart:** Contains the `CounterScreenRedux` widget, which displays the current count and provides buttons to increment and decrement the count. It utilizes Redux for state management.
- **state/redux/actions.dart:** Defines the actions used in the Redux architecture. In this case, `IncrementAction` and `DecrementAction` are defined.
- **state/redux/reducers.dart:** Contains the reducer function responsible for updating the state based on dispatched actions.
- **state/redux/store.dart:** Creates the Redux store with an initial state and the defined reducer function.

## Dependencies

- [Flutter](https://flutter.dev/)
- [redux](https://pub.dev/packages/redux): A predictable state container for Dart and Flutter apps.
- [flutter_redux](https://pub.dev/packages/flutter_redux): A set of utilities that allow you to easily consume a Redux Store to build Flutter Widgets.
- [material](https://api.flutter.dev/flutter/material/material-library.html): Material Design widgets for building UIs.