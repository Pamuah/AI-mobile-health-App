import 'package:ai_mhealth_app/models/medication.model.dart';
import 'package:flutter/foundation.dart';

class MedicationData extends ChangeNotifier {
  List<Medication> medications = [
    Medication(
      name: "Nugel-O",
      duration: 5,
      morining: DateTime.utc(09, 10),
      afternoon: DateTime.utc(15, 00),
      evening: DateTime.utc(20, 00),
      completed: true,
    ),
    Medication(
      name: "Panadol",
      duration: 5,
      morining: DateTime.utc(09, 10),
      afternoon: DateTime.utc(15, 00),
      evening: DateTime.utc(20, 00),
    ),
    Medication(
      name: "Gebedol",
      duration: 5,
      morining: DateTime.utc(09, 10),
      afternoon: DateTime.utc(15, 00),
      evening: DateTime.utc(20, 00),
    ),
    Medication(
      name: "Speman",
      duration: 5,
      morining: DateTime.utc(09, 10),
      afternoon: DateTime.utc(15, 00),
      evening: DateTime.utc(20, 00),
      completed: true,
    ),
    Medication(
      name: "Dexatrol",
      duration: 5,
      morining: DateTime.utc(09, 10),
      afternoon: DateTime.utc(15, 00),
      evening: DateTime.utc(20, 00),
    )
  ];

  // Getters
  Medication getMedicationByIndex(int index) {
    return medications[index];
  }

  int completedMedications() {
    int completed = 0;

    for (Medication med in medications) {
      if (med.completed) {
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
