import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/data/data.dart';

/// The initial screen that user see.
class SplashScreen extends StatelessWidget {
  /// Constructs an instance of [SplashScreen].
  const SplashScreen({super.key});

  /// [SplashScreen] route name to be used in routing.
  static const routeName = 'splash_screen';

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.cardColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Welcome!',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 64),
              Text(
                // ignore: missing_whitespace_between_adjacent_strings
                'Please choose that you want to use the Gemini Flash model with'
                'default config or you want customize the default settings.',
                style: context.theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 64),
              Column(
                children: <Widget>[
                  TextButton(
                    style: context.theme.textButtonTheme.style?.copyWith(
                      fixedSize: WidgetStateProperty.all(
                        Size(context.mediaQuery.size.width - 32, 36),
                      ),
                    ),
                    onPressed: () async => navigateToChatScreen(
                      context,
                      ModelSettings(),
                    ),
                    child: const Text('Use Gemini Flash model'),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    style: context.theme.textButtonTheme.style?.copyWith(
                      fixedSize: WidgetStateProperty.all(
                        Size(context.mediaQuery.size.width - 32, 36),
                      ),
                    ),
                    onPressed: () async => navigateToConfigScreen(context),
                    child: const Text('Use a customized model'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
