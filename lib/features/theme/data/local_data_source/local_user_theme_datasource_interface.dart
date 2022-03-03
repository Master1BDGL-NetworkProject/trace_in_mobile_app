import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/sucess_operation/success_operation.dart';
import '../../domain/entities/user_theme.dart';
import '../../domain/usescases/params/change_user_theme_params.dart';

abstract class ILocalUserThemeDatasource {
  /// Change user theme
  Either<Exception, SucessOperation> changeUserTheme(
      ChangeUserThemeParams params);

  /// Get user theme
  Either<Exception, UserTheme> getUserTheme();
}
