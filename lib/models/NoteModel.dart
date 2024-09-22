import 'package:hive/hive.dart';
part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class Notemodel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String dateTime;
  @HiveField(3)
  int color1;
  @HiveField(4)
  int color2;
  Notemodel(
      {required this.dateTime,
      required this.description,
      required this.title,
      required this.color1,
      required this.color2});
}
