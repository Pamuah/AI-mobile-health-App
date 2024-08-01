import 'package:hive/hive.dart';

part 'history.g.dart';

@HiveType(typeId: 0)
class History extends HiveObject {
  @HiveField(0)
  String diagnosis;

  @HiveField(1)
  String generatedText;

  @HiveField(2)
  String date;

  @HiveField(3)
  String symptoms;

  History(
      {required this.diagnosis,
      required this.generatedText,
      required this.date,
      required this.symptoms});
}
