// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserThemeAdapter extends TypeAdapter<UserTheme> {
  @override
  final int typeId = 0;

  @override
  UserTheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTheme(
      themeType: fields[1] as ThemeType,
    );
  }

  @override
  void write(BinaryWriter writer, UserTheme obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._key)
      ..writeByte(1)
      ..write(obj.themeType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ThemeTypeAdapter extends TypeAdapter<ThemeType> {
  @override
  final int typeId = 1;

  @override
  ThemeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ThemeType.dark;
      case 1:
        return ThemeType.light;
      default:
        return ThemeType.dark;
    }
  }

  @override
  void write(BinaryWriter writer, ThemeType obj) {
    switch (obj) {
      case ThemeType.dark:
        writer.writeByte(0);
        break;
      case ThemeType.light:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
