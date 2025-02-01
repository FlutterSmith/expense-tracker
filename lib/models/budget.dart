import 'package:hive/hive.dart';

@HiveType(typeId: 2)
class Budget {
  @HiveField(0)
  final String category;
  @HiveField(1)
  final double limit;
  Budget({required this.category, required this.limit});
}
