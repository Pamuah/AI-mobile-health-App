import 'package:ai_mhealth_app/models/medication.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MedicationData extends ChangeNotifier {
  List<Medication> medications = [
    // Medication(
    //   id: 1,
    //   name: "Nugel-O",
    //   completed: 1,
    // ),
    // Medication(
    //   id: 10,
    //   name: "Panadol",
    //   // duration: 5,
    // ),
    // Medication(
    //   id: 100,
    //   name: "Gebedol",
    //   // duration: 5,
    // ),
    // Medication(
    //   id: 1000,
    //   name: "Speman",
    //   // duration: 5,
    //   completed: 1,
    // ),
    // Medication(
    //   id: 10000,
    //   name: "Dexatrol",
    //   // duration: 5,
    // )
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
