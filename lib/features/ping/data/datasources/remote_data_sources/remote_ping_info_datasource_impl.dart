import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/exceptions/network/no_connection_exception.dart';
import '../../../../../core/utils/api_urls.dart';
import '../../../../../core/utils/network_info/network_info_interface.dart';
import '../../../../../core/utils/query_string.dart';
import '../../../domain/entities/ping_info.dart';
import '../../factories/ping_info_factory.dart';
import 'remote_ping_info_datasource_interface.dart';

class RemotePingInfoDatasourceImpl implements IRemotePingInfoDatasource {
  final http.Client _client;
  final IApiUrls _apiUrls;
  final INetworkInfo _iNetworkInfo;

  RemotePingInfoDatasourceImpl(this._client, this._apiUrls, this._iNetworkInfo);

  @override
  Future<Either<Exception, List<PingInfo>>> getPingInfo(
      QueryString params) async {
    try {
      if (!(await _iNetworkInfo.hasConnection)) {
        return const Left(NoConnectionException());
      } else {
        final _response = await _client
            .get(Uri.parse('${_apiUrls.pingUrl}?${params.toQueryString()}'));
        if (_response.statusCode == 200) {
          // Extract response
          final _pingInfos = (json.decode(_response.body)['data'] as List)
              .map((_pinfoInfo) => PingInfoFactory.fromJson(_pinfoInfo))
              .toList();
          return Right(_pingInfos);
        }
        return Left(Exception(_response.body));
      }
    } catch (e, stack) {
      debugPrintStack(stackTrace: stack);
      return Left(Exception(e));
    }
  }
}
