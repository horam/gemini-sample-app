import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/presentations/presentations.dart';

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
              Text(
                'You can experiment with this app in two ways:',
                style: context.theme.textTheme.bodyLarge,
              ),
              Text(
                '1. Use Gemini Flash model with default config \n'
                '2. Use other models and/or customize the default settings.',
                style: context.theme.textTheme.bodyLarge,
              ),
              Column(
                children: <Widget>[
                  PrimaryButton(
                    onPressed: () async => navigateToChatScreen(
                      context,
                      ModelSettings(),
                    ),
                    text: 'Use Gemini Flash model',
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    onPressed: () async => navigateToConfigScreen(context),
                    text: 'Use a customized model',
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
