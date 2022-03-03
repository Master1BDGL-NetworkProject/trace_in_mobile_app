import 'package:dartz/dartz.dart';

import '../../../../core/utils/query_string.dart';
import '../../domain/entities/ping_info.dart';
import '../../domain/repositories/ping_info_repository_interface.dart';
import '../datasources/remote_data_sources/remote_ping_info_datasource_interface.dart';

class PingInfoRepositoryImpl implements IPingInfoRepository {
  final IRemotePingInfoDatasource _iRemotePingInfoDatasource;
  PingInfoRepositoryImpl(
      {required IRemotePingInfoDatasource remotePingInfoRepository})
      : _iRemotePingInfoDatasource = remotePingInfoRepository;

  @override
  Future<Either<Exception, List<PingInfo>>> getPingInfo(QueryString params) {
    return _iRemotePingInfoDatasource.getPingInfo(params);
  }

  @override
  Future<void> savePingInfo(PingInfo pingInfo) {
    throw UnimplementedError();
  }
}
