import 'package:expense_tracker/models/expense.dart';
import 'package:hive/hive.dart';

class ExpenseAdapter extends TypeAdapter<Expense> {
  @override
  final int typeId = 0;
  @override
  Expense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()
    };
    return Expense(
        id: fields[0] as String,
        title: fields[1] as String,
        amount: fields[2] as double,
        date: fields[3] as DateTime,
        category: fields[4] as String);
  }

  @override
  void write(BinaryWriter writer, Expense obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.category);
  }
}
