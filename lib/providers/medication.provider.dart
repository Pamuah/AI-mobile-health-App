import 'package:ai_mhealth_app/models/medication.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MedicationData extends ChangeNotifier {
  List<Medication> medications = [
    Medication(
      name: "Nugel-O",
      duration: 5,
      // morning: const TimeOfDay(hour: 8, minute: 30),
      // afternoon: const TimeOfDay(hour: 12, minute: 30),
      // evening: const TimeOfDay(hour: 22, minute: 30),
      completed: 1,
    ),
    Medication(
      name: "Panadol",
      duration: 5,
      // morning: const TimeOfDay(hour: 8, minute: 30),
      // afternoon: const TimeOfDay(hour: 12, minute: 30),
      // evening: const TimeOfDay(hour: 22, minute: 30),
    ),
    Medication(
      name: "Gebedol",
      duration: 5,
      // morning: const TimeOfDay(hour: 8, minute: 30),
      // afternoon: const TimeOfDay(hour: 12, minute: 30),
      // evening: const TimeOfDay(hour: 22, minute: 30),
    ),
    Medication(
      name: "Speman",
      duration: 5,
      // morning: const TimeOfDay(hour: 8, minute: 30),
      // afternoon: const TimeOfDay(hour: 12, minute: 30),
      // evening: const TimeOfDay(hour: 22, minute: 30),
      completed: 1,
    ),
    Medication(
      name: "Dexatrol",
      duration: 5,
      // morning: const TimeOfDay(hour: 8, minute: 30),
      // afternoon: const TimeOfDay(hour: 12, minute: 30),
      // evening: const TimeOfDay(hour: 22, minute: 30),
    )
  ];

  // Getters
  Medication getMedicationByIndex(int index) {
    return medications[index];
  }

  int completedMedications() {
    int completed = 0;

    for (Medication med in medications) {
      if (med.completed == 1) {
        completed += 1;
      }
    }
    return completed;
  }

  int get medicationsLength => medications.length;

  // Methods
  void mergeWithMedications(List<Medication> newMedication) {
    medications.addAll(newMedication);
    notifyListeners();
  }

  void emptyMedications() {
    medications.clear();
    notifyListeners();
  }
}
