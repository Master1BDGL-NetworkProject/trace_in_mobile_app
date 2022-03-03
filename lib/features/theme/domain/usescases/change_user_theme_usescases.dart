import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/sucess_operation/success_operation.dart';
import '../../../../core/utils/usescases.dart';
import '../../data/local_data_source/local_user_theme_datasource_interface.dart';
import 'params/change_user_theme_params.dart';

class ChangeUserThemeUsecases
    implements NonFutureUsescase<ChangeUserThemeParams, SucessOperation> {
  final ILocalUserThemeDatasource _localUserThemeDatasource;

  ChangeUserThemeUsecases(this._localUserThemeDatasource);

  @override
  Either<Exception, SucessOperation> trigger(ChangeUserThemeParams params) {
    return _localUserThemeDatasource.changeUserTheme(params);
  }
}
