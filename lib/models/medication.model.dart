// import 'package:flutter/material.dart';

class Medication {
  final String name;
  final int duration;
  // final TimeOfDay? morning;
  // final TimeOfDay? afternoon;
  // final TimeOfDay? evening;
  final int completed;

  Medication({
    required this.name,
    required this.duration,
    // required this.morning,
    // required this.afternoon,
    // required this.evening,
    this.completed = 0,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      name: json['name'],
      duration: json['duration'],
      completed: json['completed'],
      // morning: json['morning'],
      // afternoon: json['afternoon'],
      // evening: json['evening'],
    );
  }
}
