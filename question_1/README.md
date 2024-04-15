# Question 1 - Counter Application (BLOC)

This Flutter project is a simple counter application that demonstrates basic state management using BLOC architecture.

## Project Structure

- **main.dart:** Entry point of the application. It initializes the app and defines routes.
- **ui/welcome/welcome.dart:** Welcome screen displayed when the app starts. It displays a welcome message and a button to navigate to the counter screen.
- **ui/counter/counter.dart:** Contains the `CounterScreen` widget, which displays the current count and provides buttons to increment and decrement the count. It utilizes BLOC (Business Logic Component) architecture for state management.
- **state/bloc/counter_bloc.dart:** Defines the `CounterBloc` class, which manages the state of the counter using BLOC pattern.

## Dependencies

- [Flutter](https://flutter.dev/)
- [material](https://api.flutter.dev/flutter/material/material-library.html): Material Design widgets for building UIs.