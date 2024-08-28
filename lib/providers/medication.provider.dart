import 'package:ai_mhealth_app/models/medication.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MedicationData extends ChangeNotifier {
  List<Medication> medications = [];

  // Completed meds
  List<Medication> completedMeds = [];

  // // // // Getters
  // Get the medications by index
  Medication getMedicationByIndex(int index) {
    return medications[index];
  }

  // int completedMedications() {
  //   int completed = 0;

  //   for (Medication med in medications) {
  //     if (med.completed == 1) {
  //       completed += 1;
  //     }
  //   }
  //   return completed;
  // }
  int completedMedsLength() {
    return completedMeds.length;
  }

  int get medicationsLength => medications.length;

  // // // Methods

  // Merge a list with meds list
  void mergeWithMedications(List<Medication> newMedication) {
    medications.addAll(newMedication);
    notifyListeners();
  }

  // Merge a list with the completed meds list
  void mergeWithCompletedMeds(List<Medication> newMedication) {
    completedMeds.addAll(newMedication);
    notifyListeners();
  }

  // Empty meds list
  void emptyMedications() {
    medications.clear();
    notifyListeners();
  }

  // Empty meds list
  void emptyCompletedMes() {
    completedMeds.clear();
    notifyListeners();
  }
}
