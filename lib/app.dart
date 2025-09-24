import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'widgets/bottom_navbar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Navigator & Routes Demo',
          theme: ThemeData.light().copyWith(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(elevation: 1),
          ),
          darkTheme: ThemeData.dark().copyWith(useMaterial3: true),
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          // Named routes
          initialRoute: '/',
          routes: {
            '/': (context) => const RootPage(),
            '/profile': (context) => const ProfilePage(),
            '/settings': (context) => const SettingsPage(),
          },
        );
      },
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [HomePage(), ProfilePage(), SettingsPage()];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
