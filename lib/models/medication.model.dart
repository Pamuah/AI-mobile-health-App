// import 'package:flutter/material.dart';

class Medication {
  final int id;
  final String name;
  final int? morningId;
  final int? afternoonId;
  final int? eveningId;
  int completed;

  Medication({
    required this.id,
    required this.name,
    required this.morningId,
    required this.afternoonId,
    required this.eveningId,
    this.completed = 0,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json["id"],
      name: json['name'],
      completed: json['completed'],
      morningId: json['morning_id'],
      afternoonId: json['afternoon_id'],
      eveningId: json['evening_id'],
    );
  }
}
