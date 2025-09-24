import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

//Events
abstract class ThemeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleTheme extends ThemeEvent {}

class SetLight extends ThemeEvent {}

class SetDark extends ThemeEvent {}

// State
class ThemeState extends Equatable {
  final bool isDark;
  const ThemeState({required this.isDark});

  @override
  List<Object?> get props => [isDark];
}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(isDark: false)) {
    on<ToggleTheme>((event, emit) {
      emit(ThemeState(isDark: !state.isDark));
    });
    on<SetLight>((event, emit) => emit(const ThemeState(isDark: false)));
    on<SetDark>((event, emit) => emit(const ThemeState(isDark: true)));
  }
}
