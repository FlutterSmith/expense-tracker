import 'package:expense_tracker/models/category.dart';
import 'package:hive/hive.dart';

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 1;
  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read()
    };
    return Category(name: fields[0] as String);
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }
}
