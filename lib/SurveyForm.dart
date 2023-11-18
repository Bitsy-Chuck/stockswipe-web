import 'package:flutter/material.dart';

import 'screen/SurveyForm2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Swipe Survey',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(body: SurveyForm2()),
    );
  }
}

class SurveyForm extends StatefulWidget {
  @override
  _SurveyFormState createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  String _selectedAgeGroup = '';
  bool _isExperiencedTrader = false;
  double _weeklyLearningTime = 0;
  String _email = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Swipe User Survey'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email (for beta release notification)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || !value!.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onSaved: (value) => _email = value!,
            ),
            SizedBox(height: 20),
            Text('Age Group:'),
            ...['18-25', '26-35', '36-45', '46-55', '56+'].map((age) {
              return RadioListTile<String>(
                title: Text(age),
                value: age,
                groupValue: _selectedAgeGroup,
                onChanged: (value) {
                  setState(() {
                    _selectedAgeGroup = value!;
                  });
                },
              );
            }).toList(),
            SwitchListTile(
              title: Text('Are you an experienced trader?'),
              value: _isExperiencedTrader,
              onChanged: (bool value) {
                setState(() {
                  _isExperiencedTrader = value;
                });
              },
            ),
            Text('Weekly time investment for learning trading (hours):'),
            Slider(
              min: 0,
              max: 20,
              divisions: 20,
              label: _weeklyLearningTime.round().toString(),
              value: _weeklyLearningTime,
              onChanged: (double value) {
                setState(() {
                  _weeklyLearningTime = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    // Process data
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
