import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dependency_inversion.dart';
import 'root.dart';

void main() async {
  await Hive.initFlutter();

  await setupDI();

  runApp(const ProviderScope(child: Root()));
}
