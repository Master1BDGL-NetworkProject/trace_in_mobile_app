import 'package:dartz/dartz.dart';

import '../../../../core/utils/usescases.dart';
import '../../data/local_data_source/local_user_theme_datasource_interface.dart';
import '../entities/user_theme.dart';
import 'params/no_params.dart';

class GetUserThemeUsecases implements NonFutureUsescase<NoParams, UserTheme> {
  final ILocalUserThemeDatasource _localUserThemeDatasource;

  GetUserThemeUsecases(this._localUserThemeDatasource);

  @override
  Either<Exception, UserTheme> trigger(NoParams params) {
    return _localUserThemeDatasource.getUserTheme();
  }
}
