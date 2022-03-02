import 'package:dartz/dartz.dart';

import '../../../../core/utils/usescases.dart';
import '../entities/ping_info.dart';
import '../repositories/ping_info_repository_interface.dart';
import 'params/get_ping_info_params.dart';

class GetPingInfoUsescase
    implements Usescase<GetPingInfoParams, List<PingInfo>> {
  final IPingInfoRepository _iPingInfoRepository;

  GetPingInfoUsescase(this._iPingInfoRepository);

  @override
  Future<Either<Exception, List<PingInfo>>> trigger(GetPingInfoParams params) {
    return _iPingInfoRepository.getPingInfo(params);
  }
}
