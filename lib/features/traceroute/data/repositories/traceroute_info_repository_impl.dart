import 'package:dartz/dartz.dart';

import '../../../../core/utils/query_string.dart';
import '../../domain/entities/traceroute_info.dart';
import '../../domain/repositories/traceroute_info_repository_interface.dart';
import '../datasources/remote_data_sources/remote_traceroute_info_datasource_interface.dart';

class TracerouteInfoRepositoryImpl implements ITracerouteInfoRepository {
  final IRemoteTracerouteInfoDatasource _iRemoteTracerouteInfoDatasource;
  TracerouteInfoRepositoryImpl(
      {required IRemoteTracerouteInfoDatasource remoteTracerouteInfoRepository})
      : _iRemoteTracerouteInfoDatasource = remoteTracerouteInfoRepository;

  @override
  Future<Either<Exception, List<TracerouteInfo>>> getTracerouteInfo(
      QueryString params) {
    return _iRemoteTracerouteInfoDatasource.getTracerouteInfo(params);
  }

  @override
  Future<void> saveTracerouteInfo(TracerouteInfo tracerouteInfo) {
    throw UnimplementedError();
  }
}
