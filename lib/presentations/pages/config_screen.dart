import 'dart:developer' as logger;

import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/data/data.dart';
import 'package:gemini_app/presentations/widgets/widgets.dart';

///  Form that let user insert her preference for AI chat.
class ConfigScreen extends StatefulWidget {
  /// Constructs an instance of [ConfigScreen].
  const ConfigScreen({super.key});

  /// [ConfigScreen]'s route name in the app's routing system.
  static const routeName = 'config_screen';

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _maxOutputTokensController =
      TextEditingController();
  final TextEditingController _topPController = TextEditingController();
  final TextEditingController _topKController = TextEditingController();
  final TextEditingController _candidateCountController =
      TextEditingController();
  final TextEditingController _blockThresholdController =
      TextEditingController();
  final TextEditingController _harmCategoryController = TextEditingController();

  final FocusNode _temperatureFocusNode = FocusNode();
  final FocusNode _maxOutputTokensFocusNode = FocusNode();
  final FocusNode _topPFocusNode = FocusNode();
  final FocusNode _topKFocusNode = FocusNode();
  final FocusNode _candidateCountFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const BackButtonWidget(),
          backgroundColor: context.theme.primaryColorDark,
          title:
              Text('Config Screen', style: context.theme.textTheme.titleLarge),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Model',
                    style: context.theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  ModelTypeSelector(
                    controller: _modelController,
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    thickness: 1,
                    color: context.theme.dividerColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Generation Config',
                    style: context.theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 32),
                  TemperatureWidget(
                    controller: _temperatureController,
                    focusNode: _temperatureFocusNode,
                  ),
                  const SizedBox(height: 32),
                  MaxOutputTokenWidget(
                    controller: _maxOutputTokensController,
                    focusNode: _maxOutputTokensFocusNode,
                  ),
                  const SizedBox(height: 32),
                  TopKWidget(
                    controller: _topKController,
                    focusNode: _topKFocusNode,
                  ),
                  const SizedBox(height: 32),
                  TopPWidget(
                    controller: _topPController,
                    focusNode: _topPFocusNode,
                  ),
                  const SizedBox(height: 32),
                  CandidateCountWidget(
                    controller: _candidateCountController,
                    focusNode: _candidateCountFocusNode,
                  ),
                  const SizedBox(height: 16),
                  Divider(
                    thickness: 1,
                    color: context.theme.dividerColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Safety Settings',
                    style: context.theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  HarmCategorySelector(controller: _harmCategoryController),
                  const SizedBox(height: 32),
                  BlockThresholdSelector(controller: _blockThresholdController),
                  const SizedBox(height: 16),
                  Divider(
                    thickness: 1,
                    color: context.theme.dividerColor,
                  ),
                  const SizedBox(height: 32),
                  SubmitButton(onPressed: _submitForm),
                ],
              ),
            ),
          ),
        ),
      );

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _logUserSelection();
      await navigateToChatScreen(
        context,
        ModelSettings.fromUser(
          modelName: _modelController.text,
          category: _harmCategoryController.text,
          threshold: _blockThresholdController.text,
          temperature: _temperatureController.text,
          maxOutputTokens: _maxOutputTokensController.text,
          topP: _topPController.text,
          topK: _topKController.text,
          candidateCount: _candidateCountController.text,
        ),
      );
    }
  }

  void _logUserSelection() {
    logger.log('model: ${_modelController.text}, '
        'category: ${_harmCategoryController.text}, '
        'category: ${_harmCategoryController.text}, '
        'threshold: ${_blockThresholdController.text}, '
        'temperature: ${_temperatureController.text}, '
        'maxOutputTokens: ${_maxOutputTokensController.text}, '
        'topP: ${_topPController.text}, topK: ${_topKController.text}, '
        'candidateCount: ${_candidateCountController.text}.');
  }

  @override
  void dispose() {
    // dispose controllers.
    _modelController.dispose();
    _temperatureController.dispose();
    _maxOutputTokensController.dispose();
    _topPController.dispose();
    _topKController.dispose();
    _candidateCountController.dispose();
    _blockThresholdController.dispose();
    _harmCategoryController.dispose();
    // dispose focus nodes.
    _temperatureFocusNode.dispose();
    _maxOutputTokensFocusNode.dispose();
    _topPFocusNode.dispose();
    _topKFocusNode.dispose();
    _candidateCountFocusNode.dispose();

    super.dispose();
  }
}
