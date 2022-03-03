import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/utils/api_urls.dart';
import '../../../../../core/utils/query_string.dart';
import '../../../domain/entities/traceroute_info.dart';
import '../../factories/traceroute_info_factory.dart';
import 'remote_traceroute_info_datasource_interface.dart';

class RemoteTracerouteInfoDatasourceImpl
    implements IRemoteTracerouteInfoDatasource {
  final http.Client _client;
  final IApiUrls _apiUrls;

  RemoteTracerouteInfoDatasourceImpl(this._client, this._apiUrls);

  @override
  Future<Either<Exception, List<TracerouteInfo>>> getTracerouteInfo(
      QueryString params) async {
    try {
      final _response = await _client.get(
          Uri.parse('${_apiUrls.tracerouteUrl}?${params.toQueryString()}'));

      if (_response.statusCode == 200) {
        // Extract response
        final _tracerouteInfos = (json.decode(_response.body)['data'] as List)
            .map((_tracerouteInfo) =>
                TracerouteInfoFactory.fromJson(_tracerouteInfo))
            .toList();
        return Right(_tracerouteInfos);
      }
      return Left(Exception(_response.body));
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      return Left(Exception(e));
    }
  }
}
