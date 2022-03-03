import 'package:hive/hive.dart';

part 'user_theme.g.dart';

@HiveType(typeId: 1)
enum ThemeType {
  @HiveField(0)
  dark,

  @HiveField(1)
  light
}

@HiveType(typeId: 0)
class UserTheme {
  @HiveField(0)
  final String _key = 'user_theme';

  String get key => _key;

  @HiveField(1)
  final ThemeType themeType;
  UserTheme({required this.themeType});
}
