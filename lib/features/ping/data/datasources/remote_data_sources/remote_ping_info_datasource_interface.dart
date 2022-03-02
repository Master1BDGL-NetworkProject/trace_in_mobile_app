import 'package:dartz/dartz.dart';

import '../../../domain/entities/ping_info.dart';
import '../../../domain/usescases/params/get_ping_info_params.dart';

abstract class IRemotePingInfoDatasource {
  /// Get ping info right after ping the concerned host
  Future<Either<Exception, List<PingInfo>>> getPingInfo(
      GetPingInfoParams params);
}
