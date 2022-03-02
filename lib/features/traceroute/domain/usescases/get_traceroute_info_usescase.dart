import 'package:dartz/dartz.dart';

import '../../../../core/utils/usescases.dart';
import '../entities/traceroute_info.dart';
import '../repositories/traceroute_info_repository_interface.dart';
import 'params/get_traceroute_info_params.dart';

class GetTracerouteInfoUsescase
    implements Usescase<GetTracerouteInfoParams, List<TracerouteInfo>> {
  final ITracerouteInfoRepository _iTracerouteInfoRepository;

  GetTracerouteInfoUsescase(this._iTracerouteInfoRepository);

  @override
  Future<Either<Exception, List<TracerouteInfo>>> trigger(
      GetTracerouteInfoParams params) {
    return _iTracerouteInfoRepository.getTracerouteInfo(params);
  }
}
