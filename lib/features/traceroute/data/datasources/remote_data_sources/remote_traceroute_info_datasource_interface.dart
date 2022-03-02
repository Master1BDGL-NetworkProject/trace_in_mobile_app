import 'package:dartz/dartz.dart';

import '../../../domain/entities/traceroute_info.dart';
import '../../../domain/usescases/params/get_traceroute_info_params.dart';

abstract class IRemoteTracerouteInfoDatasource {
  /// Get ping info right after ping the concerned host
  Future<Either<Exception, List<TracerouteInfo>>> getTracerouteInfo(
      GetTracerouteInfoParams params);
}
