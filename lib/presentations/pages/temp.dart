import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart'; // Import your package
import 'dart:developer' as logger;

class GenerationConfigForm extends StatefulWidget {
  @override
  _GenerationConfigFormState createState() => _GenerationConfigFormState();
}

class _GenerationConfigFormState extends State<GenerationConfigForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _maxOutputTokensController =
      TextEditingController();
  final TextEditingController _topPController = TextEditingController();
  final TextEditingController _topKController = TextEditingController();
  final TextEditingController _candidateCountController =
      TextEditingController();

  final FocusNode _temperatureFocusNode = FocusNode();
  final FocusNode _maxOutputTokensFocusNode = FocusNode();
  final FocusNode _topPFocusNode = FocusNode();
  final FocusNode _topKFocusNode = FocusNode();
  final FocusNode _candidateCountFocusNode = FocusNode();

  @override
  void dispose() {
    _temperatureController.dispose();
    _maxOutputTokensController.dispose();
    _topPController.dispose();
    _topKController.dispose();
    _candidateCountController.dispose();

    _temperatureFocusNode.dispose();
    _maxOutputTokensFocusNode.dispose();
    _topPFocusNode.dispose();
    _topKFocusNode.dispose();
    _candidateCountFocusNode.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final GenerationConfig config = GenerationConfig(
        temperature: double.tryParse(_temperatureController.text),
        maxOutputTokens: int.tryParse(_maxOutputTokensController.text),
        topP: double.tryParse(_topPController.text),
        topK: int.tryParse(_topKController.text),
        candidateCount: int.tryParse(_candidateCountController.text),
      );

      // Use the config object as needed
      logger.log('GenerationConfig: $config');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generation Config Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _temperatureController,
                  focusNode: _temperatureFocusNode,
                  decoration: InputDecoration(labelText: 'Temperature'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter temperature';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _maxOutputTokensController,
                  focusNode: _maxOutputTokensFocusNode,
                  decoration: InputDecoration(labelText: 'Max Output Tokens'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter max output tokens';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _topPController,
                  focusNode: _topPFocusNode,
                  decoration: InputDecoration(labelText: 'Top P'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter top P';
                    }
                    return null;
                  },
                ),
                // TextFormField(
                //   controller: _topKController,
                //   focusNode: _topKFocusNode,
                //   decoration: InputDecoration(labelText: 'Top K'),
                //   keyboardType: TextInputType.number,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter top K';
                //     }
                //     return null;
                //   },
                // ),
                // TextFormField(
                //   controller: _candidateCountController,
                //   focusNode: _candidateCountFocusNode,
                //   decoration: InputDecoration(labelText: 'Candidate Count'),
                //   keyboardType: TextInputType.number,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please enter candidate count';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GenerationConfigForm(),
  ));
}
