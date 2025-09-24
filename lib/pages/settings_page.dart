import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Halaman Pengaturan'),
            const SizedBox(height: 16),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: state.isDark,
                  onChanged: (val) {
                    // trigger bloc event
                    themeBloc.add(ToggleTheme());
                  },
                );
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                // demonstration of programmatic route navigation
                Navigator.pushNamed(context, '/profile');
              },
              child: const Text('Buka Profile (via Navigator)'),
            ),
          ],
        ),
      ),
    );
  }
}
