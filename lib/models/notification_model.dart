import 'package:hive/hive.dart';

part 'notification_model.g.dart';

@HiveType(typeId: 1)
class Notify extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String date;

  @HiveField(2)
  String info;

  @HiveField(3)
  int id;

  Notify({required this.title, required this.date, required this.info, required this.id});
}
