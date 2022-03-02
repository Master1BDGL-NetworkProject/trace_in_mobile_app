import 'package:dartz/dartz.dart';

import '../../domain/entities/traceroute_info.dart';
import '../../domain/repositories/traceroute_info_repository_interface.dart';
import '../../domain/usescases/params/get_traceroute_info_params.dart';
import '../datasources/remote_data_sources/remote_traceroute_info_datasource_interface.dart';

class TracerouteInfoRepositoryImpl implements ITracerouteInfoRepository {
  final IRemoteTracerouteInfoDatasource _iRemoteTracerouteInfoDatasource;
  TracerouteInfoRepositoryImpl(
      {required IRemoteTracerouteInfoDatasource remoteTracerouteInfoRepository})
      : _iRemoteTracerouteInfoDatasource = remoteTracerouteInfoRepository;

  @override
  Future<Either<Exception, List<TracerouteInfo>>> getTracerouteInfo(
      GetTracerouteInfoParams params) {
    return _iRemoteTracerouteInfoDatasource.getTracerouteInfo(params);
  }

  @override
  Future<void> saveTracerouteInfo(TracerouteInfo tracerouteInfo) {
    throw UnimplementedError();
  }
}
