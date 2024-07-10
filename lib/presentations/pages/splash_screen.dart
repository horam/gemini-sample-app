import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: context.theme.cardColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'welcome to Gemini demo app',
                textAlign: TextAlign.center,
                style: context.theme.textTheme.headlineLarge,
              ),
              const SizedBox(height: 64),
              // Todo(Horam): update this text and add the name of the default
              // model and its settings.
              Text(
                'Please choose that you want to use the default model with'
                ' default config or you want customize the default settings.',
                style: context.theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => navigateToChatScreen(context),
                    child: const Text('Use default model'),
                  ),
                  ElevatedButton(
                    onPressed: () => navigateToConfigScreen(context),
                    child: const Text('Customize the model'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
