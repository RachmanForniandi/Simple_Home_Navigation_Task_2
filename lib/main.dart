import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'app.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => ThemeBloc(), // provide ThemeBloc globally
      child: const MyApp(),
    ),
  );
}
