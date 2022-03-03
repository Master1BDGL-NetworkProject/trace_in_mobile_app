import 'package:dartz/dartz.dart';

import '../../../../exceptions/sucess_operation/success_operation.dart';
import '../../domain/entities/user_theme.dart';
import '../../domain/usescases/params/change_user_theme_params.dart';

abstract class ILocalUserThemeDatasource {
  Either<Exception, SucessOperation> changeUserTheme(
      ChangeUserThemeParams params);
  Either<Exception, UserTheme> getUserTheme();
}
