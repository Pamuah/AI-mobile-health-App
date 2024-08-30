import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../models/api.dart';

class HealthEduScreen extends StatefulWidget {
  static const routeName = '/health-education';
  const HealthEduScreen({super.key});

  @override
  State<HealthEduScreen> createState() => _HealthEduScreenState();
}

class _HealthEduScreenState extends State<HealthEduScreen> {
  String title = "Loading...";
  String tip = "Please wait a moment.";
  int currentID = 0;
  Timer? _timer;
  final String serverEndPoint = Api.userEndpoint;

  @override
  void initState() {
    super.initState();
    fetchTip(currentID);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(hours: 24), (timer) {
      setState(() {
        currentID++;
      });
      fetchTip(currentID);
    });
  }

  Future<void> fetchTip(int id) async {
    try {
      final response = await http.get(Uri.parse('$serverEndPoint/tips'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Response data: $data'); // Debug statement

        setState(() {
          if (data.isNotEmpty && id < data.length) {
            title = data[id]['title'];
            tip = data[id]['tip'];
          } else {
            // Wrap around if id exceeds data length
            title = data[id % data.length]['title'];
            tip = data[id % data.length]['tip'];
          }
        });
      } else {
        setState(() {
          title = "Failed to load tip";
          tip = "";
        });
      }
    } catch (e) {
      print('Error fetching tips: $e'); // Debug statement
      setState(() {
        title = "Failed to load tip";
        tip = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Tip of the Day",
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: color.secondary),
        ),
        centerTitle: true,
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 154, 181, 227),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: color.primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      tip,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
