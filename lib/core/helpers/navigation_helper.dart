import 'package:flutter/material.dart';
import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/presentations/presentations.dart';

/// handles navigation to chat screen.
Future<void> navigateToChatScreen(
  BuildContext context,
  ModelSettings settings,
) async =>
    Navigator.pushNamedAndRemoveUntil(
      context,
      ChatScreen.routeName,
      ModalRoute.withName(SplashScreen.routeName),
      arguments: settings,
    );

/// Handles yje navigation to the config screen.
Future<void> navigateToConfigScreen(BuildContext context) async =>
    Navigator.pushNamed(
      context,
      ConfigScreen.routeName,
    );
