import 'package:dartz/dartz.dart';

import '../entities/traceroute_info.dart';
import '../usescases/params/get_traceroute_info_params.dart';

abstract class ITracerouteInfoRepository {
  /// Get ping info right after ping the concerned host
  Future<Either<Exception, List<TracerouteInfo>>> getTracerouteInfo(
      GetTracerouteInfoParams params);

  /// Save ping info in storage
  Future<void> saveTracerouteInfo(TracerouteInfo tracerouteInfo);
}
