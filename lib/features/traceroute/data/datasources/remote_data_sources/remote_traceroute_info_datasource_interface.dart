import 'package:dartz/dartz.dart';

import '../../../../../core/utils/query_string.dart';
import '../../../domain/entities/traceroute_info.dart';

abstract class IRemoteTracerouteInfoDatasource {
  /// Get ping info right after ping the concerned host
  Future<Either<Exception, List<TracerouteInfo>>> getTracerouteInfo(
      QueryString params);
}
