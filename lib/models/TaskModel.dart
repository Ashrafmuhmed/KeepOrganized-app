import 'package:hive/hive.dart';
part 'TaskModel.g.dart';

@HiveType(typeId: 1)
class Taskmodel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? subtitle;
  Taskmodel({required this.subtitle, required this.title});
}
