import 'package:dartz/dartz.dart';

import '../entities/ping_info.dart';
import '../usescases/params/get_ping_info_params.dart';

abstract class IPingInfoRepository {
  /// Get ping info right after ping the concerned host
  Future<Either<Exception, List<PingInfo>>> getPingInfo(
      GetPingInfoParams params);

  /// Save ping info in storage
  Future<void> savePingInfo(PingInfo pingInfo);
}
