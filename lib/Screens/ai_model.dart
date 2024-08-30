import 'dart:convert';

import 'package:ai_mhealth_app/Screens/prediction.dart';
import 'package:ai_mhealth_app/models/api.dart';
import 'package:ai_mhealth_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class AiModelScreen extends StatefulWidget {
  static const routeName = '/model';
  const AiModelScreen({super.key});

  @override
  State<AiModelScreen> createState() => _AiModelScreenState();
}

class _AiModelScreenState extends State<AiModelScreen> {
  final TextEditingController symptomsController = TextEditingController();
  final String serverEndPoint = Api.modelEndPoint;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, int> symptomsMap = {
    'itching': 0,
    'skin rash': 0,
    'nodal skin eruptions': 0,
    'continuous sneezing': 0,
    'shivering': 0,
    'chills': 0,
    'joint pain': 0,
    'stomach pain': 0,
    'acidity': 0,
    'ulcers on tongue': 0,
    'muscle wasting': 0,
    'vomiting': 0,
    'burning micturition': 0,
    'spotting urination': 0,
    'fatigue': 0,
    'weight gain': 0,
    'anxiety': 0,
    'cold hands and feets': 0,
    'mood swings': 0,
    'weight loss': 0,
    'restlessness': 0,
    'lethargy': 0,
    'patches in throat': 0,
    'irregular sugar level': 0,
    'cough': 0,
    'high fever': 0,
    'sunken eyes': 0,
    'breathlessness': 0,
    'sweating': 0,
    'dehydration': 0,
    'indigestion': 0,
    'headache': 0,
    'yellowish skin': 0,
    'dark urine': 0,
    'nausea': 0,
    'loss of appetite': 0,
    'pain behind the eyes': 0,
    'back pain': 0,
    'constipation': 0,
    'abdominal pain': 0,
    'diarrhoea': 0,
    'mild fever': 0,
    'yellow urine': 0,
    'yellowing of eyes': 0,
    'acute liver failure': 0,
    'fluid overload': 0,
    'swelling of stomach': 0,
    'swelled lymph nodes': 0,
    'malaise': 0,
    'blurred and distorted vision': 0,
    'phlegm': 0,
    'throat irritation': 0,
    'redness of eyes': 0,
    'sinus pressure': 0,
    'runny nose': 0,
    'congestion': 0,
    'chest pain': 0,
    'weakness in limbs': 0,
    'fast heart rate': 0,
    'pain during bowel movements': 0,
    'pain in anal region': 0,
    'bloody stool': 0,
    'irritation in anus': 0,
    'neck pain': 0,
    'dizziness': 0,
    'cramps': 0,
    'bruising': 0,
    'obesity': 0,
    'swollen legs': 0,
    'swollen blood vessels': 0,
    'puffy face and eyes': 0,
    'enlarged thyroid': 0,
    'brittle nails': 0,
    'swollen extremeties': 0,
    'excessive hunger': 0,
    'extra marital contacts': 0,
    'drying and tingling lips': 0,
    'slurred speech': 0,
    'knee pain': 0,
    'hip joint pain': 0,
    'muscle weakness': 0,
    'stiff neck': 0,
    'swelling joints': 0,
    'movement stiffness': 0,
    'spinning movements': 0,
    'loss of balance': 0,
    'unsteadiness': 0,
    'weakness of one body side': 0,
    'loss of smell': 0,
    'bladder discomfort': 0,
    'foul smell of urine': 0,
    'continuous feel of urine': 0,
    'passage of gases': 0,
    'internal itching': 0,
    'toxic look (typhos)': 0,
    'depression': 0,
    'irritability': 0,
    'muscle pain': 0,
    'altered sensorium': 0,
    'red spots over body': 0,
    'belly pain': 0,
    'abnormal menstruation': 0,
    'dischromic patches': 0,
    'watering from eyes': 0,
    'increased appetite': 0,
    'polyuria': 0,
    'family history': 0,
    'mucoid sputum': 0,
    'rusty sputum': 0,
    'lack of concentration': 0,
    'visual disturbances': 0,
    'receiving blood transfusion': 0,
    'receiving unsterile injections': 0,
    'coma': 0,
    'stomach bleeding': 0,
    'distention of abdomen': 0,
    'history of alcohol consumption': 0,
    'fluid overload.1': 0,
    'blood in sputum': 0,
    'prominent veins on calf': 0,
    'palpitations': 0,
    'painful walking': 0,
    'pus filled pimples': 0,
    'blackheads': 0,
    'scurring': 0,
    'skin peeling': 0,
    'silver like dusting': 0,
    'small dents in nails': 0,
    'inflammatory nails': 0,
    'blister': 0,
    'red sore around nose': 0,
    'yellow crust ooze': 0,
  };

  @override
  void dispose() {
    symptomsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.secondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                color: color.onPrimary,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            children: <TextSpan>[
              const TextSpan(
                text: 'Health ',
              ),
              TextSpan(text: 'AI', style: TextStyle(color: color.primary)),
            ],
          ),
        ),
        leading: Container(
          height: 55,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.primary,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24,
              color: color.onPrimary,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Container(
                      height: 200,
                      width: 270,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color.primary,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/robo_image.png',
                        height: 220,
                        width: 250,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 90.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: color.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome, ',
                          style: TextStyle(
                            color: color.onPrimary,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'I am your AI Assistant.',
                          style: TextStyle(color: color.onPrimary, height: 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          height: 0,
                          color: color.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nEnter your sympoms in the textbox below.',
                          style: TextStyle(
                            color: color.onPrimary,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text:
                              '\nTo ensure accuracy of the prediction, seperate each symptom with a comma.',
                          style: TextStyle(
                            color: color.onPrimary,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: '\nFor example: headache, nausea,...',
                          style: TextStyle(
                            color: color.onPrimary,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: SizedBox(
                    // height: 90,
                    width: double.infinity,
                    child: TextField(
                      controller: symptomsController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: color.secondary, width: 2.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Enter your Symptoms here',
                        hintStyle: TextStyle(
                            fontSize: 24,
                            color: color.onPrimary,
                            fontWeight: FontWeight.w500),
                      ),
                      style: TextStyle(
                          fontSize: 24,
                          color: color.onPrimary,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                  width: 0.001,
                ),
                CustomElevatedButton(
                    text: "Proceed",
                    onPressed: () async {
                      SystemChannels.textInput
                          .invokeMethod<void>('TextInput.hide');
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        final input = symptomsController.value.text.trim();
                        predict(input);
                        Navigator.pushNamed(context, PredictionScreen.routeName,
                            arguments: {"data": input});
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Predict
  void predict(String input) async {
    input = input.toLowerCase();
    // print(input);
    List<String> inputSymptoms = input.split(",");
    for (var symptom in inputSymptoms) {
      symptom = symptom.trim();
      if (symptomsMap.containsKey(symptom)) {
        symptomsMap[symptom] = 1;
      }
    }
    List<int> symptoms = symptomsMap.values.toList();
    // print(symptoms);
    final res = await http.post(
      Uri.parse("$serverEndPoint/predict"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "data": symptoms,
        },
      ),
    );
    print(res.body);
    // Todo: Use symptoms list to make Api call to model.
  }
}
