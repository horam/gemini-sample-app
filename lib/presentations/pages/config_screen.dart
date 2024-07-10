import 'package:flutter/material.dart';
import 'package:gemini_app/core/core.dart';
import 'package:gemini_app/presentations/widgets/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:developer' as logger;

///  Form that let user insert her preference for AI chat.
class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tune the model.'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final GenerationConfig config = GenerationConfig(
        temperature: double.tryParse(_temperatureController.text),
        maxOutputTokens: int.tryParse(_maxOutputTokensController.text),
        topP: double.tryParse(_topPController.text),
        topK: int.tryParse(_topKController.text),
        candidateCount: int.tryParse(_candidateCountController.text),
      );
      final String model = _modelController.text;
      // Use the config object as needed
      logger.log('GenerationConfig: $config');
      logger.log('chosen AI model: $model');
      navigateToChatScreen(context);
    }
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
