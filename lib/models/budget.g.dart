import 'package:expense_tracker/models/budget.dart';
import 'package:hive/hive.dart';

class BudgetAdapter extends TypeAdapter<Budget> {
  @override
  final int typeId = 2;
  @override
  Budget read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()};
    return Budget(category: fields[0] as String, limit: fields[1] as double);
  }
  @override
  void write(BinaryWriter writer, Budget obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.limit);
  }
}
