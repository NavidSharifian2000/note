import 'package:hive_flutter/hive_flutter.dart';
part 'enum_tasktypes.g.dart';

@HiveType(typeId: 7)
enum TaskTypeEnum {
  @HiveField(0)
  working,
  @HiveField(1)
  date,
  @HiveField(2)
  Focus
}
