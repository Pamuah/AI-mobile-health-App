import 'package:hive_flutter/hive_flutter.dart';

import '../models/history.dart';
import '../models/notification_model.dart';

class HistoryService {
  final String _boxName = "Histories";

  Future<Box<History>> get _box async => await Hive.openBox<History>(_boxName);

//create
  Future<void> addHistory(History history) async {
    var box = await _box;
    await box.add(history);
  }

//read
  Future<List<History>> getAllHsitory() async {
    var box = await _box;
    return box.values.toList();
  }

//update
  Future<void> updateDeck(int index, History history) async {
    var box = await _box;
    await box.putAt(index, history);
  }

//delete
  Future<void> deleteHistory(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}

class NotifyService {
  final String _boxName = "notifications";

  Future<Box<Notify>> get _box async => await Hive.openBox<Notify>(_boxName);

//create
  Future<void> addNotification(Notify notification) async {
    var box = await _box;
    await box.add(notification);
  }

//read
  Future<List<Notify>> getAllNotifications() async {
    var box = await _box;
    return box.values.toList();
  }

//update
  Future<void> updateDeck(int index, Notify notification) async {
    var box = await _box;
    await box.putAt(index, notification);
  }

//delete
  Future<void> deleteNotification(int index) async {
    var box = await _box;
    await box.deleteAt(index);
  }
}
