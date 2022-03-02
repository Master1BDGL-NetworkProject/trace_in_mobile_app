import 'package:dartz/dartz.dart';

import '../../domain/entities/ping_info.dart';
import '../../domain/repositories/ping_info_repository_interface.dart';
import '../../domain/usescases/params/get_ping_info_params.dart';
import '../datasources/remote_data_sources/remote_ping_info_datasource_interface.dart';

class PingInfoRepositoryImpl implements IPingInfoRepository {
  final IRemotePingInfoDatasource _iRemotePingInfoDatasource;
  PingInfoRepositoryImpl(
      {required IRemotePingInfoDatasource remotePingInfoRepository})
      : _iRemotePingInfoDatasource = remotePingInfoRepository;

  @override
  Future<Either<Exception, List<PingInfo>>> getPingInfo(
      GetPingInfoParams params) {
    return _iRemotePingInfoDatasource.getPingInfo(params);
  }

  @override
  Future<void> savePingInfo(PingInfo pingInfo) {
    throw UnimplementedError();
  }
}
