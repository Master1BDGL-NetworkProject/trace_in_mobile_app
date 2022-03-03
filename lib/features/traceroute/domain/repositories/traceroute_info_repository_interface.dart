import 'package:dartz/dartz.dart';

import '../../../../core/utils/query_string.dart';
import '../entities/traceroute_info.dart';

abstract class ITracerouteInfoRepository {
  /// Get ping info right after ping the concerned host
  Future<Either<Exception, List<TracerouteInfo>>> getTracerouteInfo(
      QueryString params);

  /// Save ping info in storage
  Future<void> saveTracerouteInfo(TracerouteInfo tracerouteInfo);
}
