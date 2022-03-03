import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../exceptions/sucess_operation/success_operation.dart';
import '../../domain/entities/user_theme.dart';
import '../../domain/usescases/params/change_user_theme_params.dart';
import 'local_user_theme_datasource_interface.dart';

class LocalUserThemeDatasourceImpl implements ILocalUserThemeDatasource {
  final Box<UserTheme> _userThemeBox;

  LocalUserThemeDatasourceImpl(this._userThemeBox);

  @override
  Either<Exception, SucessOperation> changeUserTheme(
      ChangeUserThemeParams params) {
    try {
      _userThemeBox.clear();
      _userThemeBox.put(params.userTheme.key, params.userTheme);
      return Right(SucessOperation());
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      return Left(Exception(e));
    }
  }

  @override
  Either<Exception, UserTheme> getUserTheme() {
    try {
      final _userTheme = _userThemeBox.get('user_theme') ??
          UserTheme(themeType: ThemeType.light);
      return Right(_userTheme);
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      return Left(Exception(e));
    }
  }
}
