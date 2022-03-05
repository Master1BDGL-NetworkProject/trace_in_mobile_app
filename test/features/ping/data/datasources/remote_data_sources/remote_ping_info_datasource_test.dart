import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:trace_in_mobile_app/core/utils/api_urls.dart';
import 'package:trace_in_mobile_app/core/utils/network_info/network_info_impl.dart';
import 'package:trace_in_mobile_app/features/ping/data/datasources/remote_data_sources/remote_ping_info_datasource_impl.dart';
import 'package:trace_in_mobile_app/features/ping/data/repositories/ping_info_repository_impl.dart';
import 'package:trace_in_mobile_app/features/ping/domain/entities/ping_info.dart';
import 'package:trace_in_mobile_app/features/ping/domain/repositories/ping_info_repository_interface.dart';
import 'package:trace_in_mobile_app/features/ping/domain/usescases/params/get_ping_info_params.dart';

import 'mock_ping_info_response.dart';

void main() {
  late final http.Client _httpClient;
  late final IApiUrls _apiUrl;
  late final IPingInfoRepository _pingRepository;
  setUpAll(() {
    _httpClient = MockClient((http.Request request) async =>
        Future.value(http.Response(jsonEncode(pingInfoMockResponse), 200)));
    _apiUrl = ApiUrlImpl();

    _pingRepository = PingInfoRepositoryImpl(
        remotePingInfoRepository: RemotePingInfoDatasourceImpl(
            _httpClient,
            _apiUrl,
            NetWorkInfoImpl(dataConnectionChecker: DataConnectionChecker())));
  });

  tearDownAll(() {
    _httpClient.close();
  });

  test('Should get ping info from mock response', () async {
    final _params = GetPingInfoParams(
        host: 'google.com', packetSize: 50, packetsNu: 3, timeOut: 5, ttl: 10);
    final _response =
        (await _pingRepository.getPingInfo(_params)).fold((l) => l, (r) => r);

    expect(_response, isA<List<PingInfo>>());
    expect((_response as List<PingInfo>).first.bits, equals(56));
    expect(_response.length, equals(15));
  });

  test('Should get ping info from the server', () async {
    late final http.Client _httpClient;
    late final IApiUrls _apiUrl;
    late final IPingInfoRepository _pingRepository;

    /// Inits
    _httpClient = http.Client();
    _apiUrl = ApiUrlImpl();

    _pingRepository = PingInfoRepositoryImpl(
        remotePingInfoRepository: RemotePingInfoDatasourceImpl(
            _httpClient,
            _apiUrl,
            NetWorkInfoImpl(dataConnectionChecker: DataConnectionChecker())));

    final _params = GetPingInfoParams(
        host: 'google.com', packetSize: 50, packetsNu: 50, timeOut: 5, ttl: 10);
    final _response =
        (await _pingRepository.getPingInfo(_params)).fold((l) => l, (r) => r);

    expect(_response, isA<List<PingInfo>>());
    expect((_response as List).length, equals(50));
  });
}
