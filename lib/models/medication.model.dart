class Medication {
  final String name;
  final int duration;
  final DateTime morining;
  final DateTime afternoon;
  final DateTime evening;
  final bool completed;

  Medication({
    required this.name,
    required this.duration,
    required this.morining,
    required this.afternoon,
    required this.evening,
    this.completed = false,
  });
}
