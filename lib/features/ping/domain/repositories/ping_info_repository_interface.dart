import 'package:dartz/dartz.dart';

import '../../../../core/utils/query_string.dart';
import '../entities/ping_info.dart';

abstract class IPingInfoRepository {
  /// Get ping info right after ping the concerned host
  Future<Either<Exception, List<PingInfo>>> getPingInfo(QueryString params);

  /// Save ping info in storage
  Future<void> savePingInfo(PingInfo pingInfo);
}
