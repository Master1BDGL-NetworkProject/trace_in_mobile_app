import 'package:dartz/dartz.dart';

import '../../../../../core/utils/query_string.dart';
import '../../../domain/entities/ping_info.dart';

abstract class IRemotePingInfoDatasource {
  /// Get ping info right after ping the concerned host
  Future<Either<Exception, List<PingInfo>>> getPingInfo(QueryString params);
}
