import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:video_player/video_player.dart';

import '../models/api.dart';
import '../models/history.dart';
import '../services/hive_service.dart';
import '../widgets/appbar.dart';
import '../widgets/custom_elevated_button.dart';

class PredictionScreen extends StatefulWidget {
  static const String routeName = '/prediction';
  const PredictionScreen({super.key});

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final String serverEndPoint = Api.modelEndPoint;
  final VideoPlayerController _videoController =
      VideoPlayerController.asset("assets/artificial-intelligence.mp4")
        ..setLooping(true);
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
  late String prediction;
  late String? genText;
  HistoryService _historyService = HistoryService();

  @override
  void initState() {
    _videoController.initialize();
    setState(() {
      _videoController.play();
    });
    super.initState();
  }

  // itching, skin rash, nodal skin eruptions
  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String input = args["data"]!;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: MyAppBar(
          title: "Results",
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: FutureBuilder(
              future: predict(input),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  prediction = snapshot.data!['prediction'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        height: 15,
                        thickness: 0.005,
                      ),
                      Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            image: DecorationImage(
                              image: AssetImage('assets/ai.png'),
                              // fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 30,
                        thickness: 0.001,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Your Symptoms are consistent with ",
                            style: TextStyle(
                              letterSpacing: 3,
                              color: color.secondary,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                            children: [
                              TextSpan(
                                text: prediction,
                                style: TextStyle(
                                  color: color.onTertiary,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ]),
                        textAlign: TextAlign.left,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          "Overview of the Progosis",
                          style: TextStyle(
                            color: color.secondary,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      FutureBuilder(
                          future: generate(prediction),
                          builder: (context, snapshot) {
                            genText = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Text(
                                genText!,
                                style: TextStyle(
                                  color: color.secondary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              );
                            }
                            return Skeletonizer(
                              enabled: true,
                              child: Text(
                                BoneMock.words(100),
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: CustomElevatedButton(
                          text: 'Back',
                          onPressed: () {
                            try {
                              saveHistory(prediction, input, genText);
                              Navigator.pop(context);
                            } catch (e) {
                              print(e);
                            }
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 250,
                            child: VideoPlayer(_videoController),
                          ),
                          const Divider(
                            height: 10,
                            thickness: 0.001,
                          ),
                          const Text("Analysing Symptoms please wait...")
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // Predict
  Future<Map<String, dynamic>> predict(String input) async {
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
    try {
      print(symptoms);
      await Future.delayed(const Duration(seconds: 3));
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
      // print(res.body);
      if (res.statusCode == 200) {
        final resData = json.decode(res.body);
        final prediction = {"prediction": resData["prediction"]};
        print(prediction);
        return prediction;
      }
      // return "prediction error";
      return {"error": "Error predicting"};
    } catch (e) {
      print(e);
      return {"error": e};
    }
  }

  // generate
  Future<String> generate(String query) async {
    String result = '';
    try {
      final model = GenerativeModel(model: 'gemini-pro', apiKey: Api.aiSecret);
      final prompt =
          'Give a brief summary of $query. Include only definition, causes and preventions';
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      result = response.text ?? '';
      print(result);
      // await Future.delayed(Duration(seconds: 7));
      return result;
    } catch (e) {
      print("Error is $e");
    }
    return 'Error';
  }

  // Save History Data
  void saveHistory(prediction, symptoms, genText) async {
    DateTime now = DateTime.now();
    var history = History(
        diagnosis: prediction,
        symptoms: symptoms,
        generatedText: genText,
        date: DateFormat('yyyy-MM-dd - kk:mm').format(now).toString());
    print(history.date);
    await _historyService.addHistory(history);
  }
}
