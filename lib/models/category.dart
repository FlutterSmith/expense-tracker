import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Category {
  @HiveField(0)
  final String name;
  Category({required this.name});
}
