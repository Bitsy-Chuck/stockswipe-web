import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:landing_page/model/FormResponse.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// void main() => runApp(MyApp());

class SurveyFormMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Swipe Get Started form',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Scaffold(body: SurveyForm2()),
    );
  }
}

class SurveyForm2 extends StatefulWidget {
  const SurveyForm2({super.key});

  @override
  State<SurveyForm2> createState() => _SurveyForm2State();
}

class _SurveyForm2State extends State<SurveyForm2> {
  late FormResponse _formResponse;
  final GlobalKey<FormState> _stepFormKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _stepFormKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _stepFormKey3 = GlobalKey<FormState>();

  int _index = 0;
  late List<Form> steps;

  @override
  void initState() {
    super.initState();
    _formResponse = FormResponse();
  }

  @override
  Widget build(BuildContext context) {
    steps = [
      buildStep1(),
      buildStep2(),
      buildStep3(),
    ];
    return Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          setState(() {
            if (_index < steps.length - 1) {
              _index += 1;
            } else {
              print("Saving form");
              _stepFormKey1.currentState!.save();
              _stepFormKey2.currentState!.save();
              _stepFormKey3.currentState!.save();

              print(_formResponse);
            }
            print("index: $_index, length: ${steps.length}");
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: [
          Step(
            title: const Text('Step 1'),
            content: Padding(
              padding: const EdgeInsets.all(5.0),
              child: steps[0],
            ),
            isActive: _index >= 1,
          ),
          Step(
              title: const Text('Trading Experience'),
              content: steps[1],
              isActive: _index >= 2),
          Step(
            title: const Text('Step 3 title'),
            content: steps[2],
            isActive: _index == 3,
            state: _index == 3 ? StepState.editing : StepState.indexed,
          ),
        ]);
  }

  Form buildStep3() {
    return Form(
      key: _stepFormKey3,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                        'How important is a community feature, like a discussion forum, in your learning journey?',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const Gap(20),
                  Expanded(
                    flex: 3,
                    child: SfSlider(
                      min: 0,
                      max: 5,
                      value: _formResponse.communityFeatureRelevance,
                      showTicks: true,
                      showLabels: true,
                      // enableTooltip: true,
                      interval: 1,
                      stepSize: 1,
                      onChanged: (dynamic value) {
                        setState(() {
                          _formResponse.communityFeatureRelevance = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Container(
              child: buildCheckbox(
                  "What features would make learning trading more engaging for you?",
                  _formResponse.engagingFeatures,
                  false),
            ),
            const Gap(20),
            Container(
              child: buildRadioTile(
                  'Would you be interested in a mentorship or expert-led guidance feature?',
                  ["Yes", "No", "Maybe"],
                  _formResponse.interestedInMentorship,
                  (value) => _formResponse.interestedInMentorship = value),
            ),
            const Gap(20),
            Container(
              child: buildRadioTile(
                  'Would you be interested in a feature that allows you to compete with other users?',
                  ["Yes", "No", "Maybe"],
                  _formResponse.interestedInCompeting,
                  (value) => _formResponse.interestedInCompeting = value),
            ),
            const Gap(20),
            Container(
              child: buildRadioTile(
                  'How do you feel about using virtual money for practicing trades?',
                  ["Positive", "Negative", "Neutral"],
                  _formResponse.feelingTowardsVirtualMoney,
                  (value) => _formResponse.feelingTowardsVirtualMoney = value),
            ),
            const Gap(20),
            Container(
              child: buildRadioTile(
                  'Would you be willing to pay for premium features?',
                  ["Yes", "No", "Maybe"],
                  _formResponse.willingToPayForPremiumFeatures,
                  (value) =>
                      _formResponse.willingToPayForPremiumFeatures = value),
            ),
            const Gap(20),
            Container(
              child: buildCheckbox(
                  'What type of premium features would you be willing to pay for?',
                  _formResponse.premiumFeatures,
                  false),
            ),
            const Gap(20),
            Container(
                child: buildRadioTile(
                    'How much time are you willing to invest per week in learning trading through an app?',
                    ["< 1 hour", "1-3 hours", "3-6 hours", "> 6 hours"],
                    _formResponse.timeInvestmentPerWeek,
                    (value) => _formResponse.timeInvestmentPerWeek = value)),
            const Gap(20),
            Container(
              child: TextFormField(
                decoration: InputDecoration(
                  labelText:
                      'What\'s the one thing you wish existed in your trading learning experience but doesn\'t?',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // if (value!.isEmpty || !value!.contains('@')) {
                  //   return 'Please enter a valid email';
                  // }
                  return null;
                },
                onSaved: (value) =>
                    _formResponse.anyOtherFeatureMissing = value!,
              ),
            )
          ],
        ),
      ),
    );
  }

  Form buildStep2() {
    return Form(
      key: _stepFormKey2,
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                          'Weekly time investment for learning trading (hours):',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    const Gap(20),
                    Expanded(
                      flex: 3,
                      // Adjust this flex value to control the width of the slider relative to the text
                      child: SfSlider(
                        min: 0,
                        max: 20,
                        value: _formResponse.weeklyLearningTime,
                        showTicks: true,
                        showLabels: true,
                        // enableTooltip: true,
                        stepSize: 0.5,
                        // Define step size
                        interval: 5,
                        onChanged: (dynamic value) {
                          setState(() {
                            _formResponse.weeklyLearningTime = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Container(
                child: buildCheckbox(
                    "What types of assets do you trade or are interested in trading?",
                    _formResponse.assetsTraded,
                    false),
              ),
              const Gap(20),
              Container(
                child: buildCheckbox(
                    "What resources do you currently use to learn about trading?",
                    _formResponse.resourcesReferred,
                    false),
              ),
              const Gap(20),
              Container(
                child: buildCheckbox(
                    "What do you find most lacking in your current learning resources",
                    _formResponse.featuresInPlatform,
                    true),
              ),
              const Gap(20),
              Container(
                child: buildCheckbox("How do you currently practice trading?",
                    _formResponse.practiceTrading, false),
              )
            ]),
      ),
    );
  }

  Form buildStep1() {
    return Form(
      key: _stepFormKey1,
      child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email (for beta release notification)',
                  hintText: 'example@email.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return null;
                  } else if (!value.contains('@')) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) => _formResponse.email = value!,
                onChanged: (value) {
                  // Implement real-time validation if needed
                },
              ),
              const Gap(20),
              TextFormField(
                //TODO use autocomplete widget
                decoration: InputDecoration(
                  labelText: 'Country',
                  hintText: 'where do you live?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onSaved: (value) => _formResponse.country = value!,
              ),
              const Gap(20),
              buildChipSelection(
                  'Age Group:',
                  ['18-25', '26-35', '36-45', '46-55', '56+'],
                  _formResponse.ageGroup,
                  (value) => _formResponse.ageGroup = value),
              const Gap(20),
              buildChipSelection(
                  "Occupation?",
                  [
                    'Financial Professional',
                    'Tech Industry',
                    'Students',
                    'Entrepreneur',
                    'Healthcare',
                    'Legal Profession',
                    'Sales and Marketting',
                    'Freelancer',
                    'Retired',
                    'Others'
                  ],
                  _formResponse.occupation,
                  (occupation) => _formResponse.occupation = occupation),
            ]),
      ),
    );
  }

  Row buildChipSelection(String title, List<String> values,
      String selectedValue, Function onSelection) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const Gap(20),
        buildChip(values, selectedValue, onSelection)
      ],
    );
  }

  Wrap buildChip(
      List<String> values, String selectedValue, Function onSelection) {
    return Wrap(
        children: values.map((value) {
      return ChoiceChip(
        label: Text(value),
        selected: selectedValue == value,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              onSelection(value);
            }
          });
        },
        selectedColor: Colors.purple[100],
      );
    }).toList());
  }

  // ['Beginner', 'Intermediate', 'Advanced']
  Container buildRadioTile(String title, List<String> values,
      String selectedValue, Function onSelection) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Gap(10),
          ...values.map((val) {
            return RadioListTile<String>(
              title: Text(val),
              value: val,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  onSelection(value);
                });
              },
            );
          }).toList()
        ],
      ),
    );
  }

  Container buildCheckbox(
      String title, Map<String, bool> state, bool enableOthersOption) {
    String _otherField = '';

    // Explicitly declare checkboxes as List<Widget>
    List<Widget> checkboxes = state.keys.map<Widget>((val) {
      return CheckboxListTile(
        title: Text(val),
        value: state[val],
        onChanged: (bool? value) {
          setState(() {
            state[val] = value ?? false;
          });
        },
      );
    }).toList();

    if (enableOthersOption) {
      checkboxes.add(
        Form(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Other',
              border: OutlineInputBorder(),
            ),
            onSaved: (value) {
              if (value != null && value.isNotEmpty) {
                _otherField = value;
                state[_otherField] = true;
              }
            },
          ),
        ),
      );
    }

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Gap(10),
          ...checkboxes,
        ],
      ),
    );
  }
}
