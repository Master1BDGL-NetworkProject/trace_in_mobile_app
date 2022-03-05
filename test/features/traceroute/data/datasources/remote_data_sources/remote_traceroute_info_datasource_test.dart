import 'dart:convert';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:trace_in_mobile_app/core/utils/api_urls.dart';
import 'package:trace_in_mobile_app/core/utils/network_info/network_info_impl.dart';
import 'package:trace_in_mobile_app/features/traceroute/data/datasources/remote_data_sources/remote_traceroute_info_datasource_impl.dart';
import 'package:trace_in_mobile_app/features/traceroute/data/repositories/traceroute_info_repository_impl.dart';
import 'package:trace_in_mobile_app/features/traceroute/domain/entities/traceroute_info.dart';
import 'package:trace_in_mobile_app/features/traceroute/domain/repositories/traceroute_info_repository_interface.dart';
import 'package:trace_in_mobile_app/features/traceroute/domain/usescases/params/get_traceroute_info_params.dart';

import 'mock_traceroute_info_response.dart';

void main() {
  late final http.Client _httpClient;
  late final IApiUrls _apiUrl;
  late final ITracerouteInfoRepository _tracerouteInfoRepository;
  setUpAll(() {
    _httpClient = MockClient((http.Request request) async => Future.value(
        http.Response(jsonEncode(tracerouteInfoMockResponse), 200)));
    _apiUrl = ApiUrlImpl();

    _tracerouteInfoRepository = TracerouteInfoRepositoryImpl(
        remoteTracerouteInfoRepository: RemoteTracerouteInfoDatasourceImpl(
            _httpClient,
            _apiUrl,
            NetWorkInfoImpl(dataConnectionChecker: DataConnectionChecker())));
  });

  tearDownAll(() {
    _httpClient.close();
  });

  test('Should get trace info from mock response', () async {
    final _params = GetTracerouteInfoParams(
        host: 'google.com',
        hopsMaxNumber: 10,
        protocol: Protocol.icmp,
        timeOut: 10);
    final _response =
        (await _tracerouteInfoRepository.getTracerouteInfo(_params))
            .fold((l) => l, (r) => r);

    expect(_response, isA<List<TracerouteInfo>>());
    expect((_response as List<TracerouteInfo>).first.packetTime,
        equals([3.526, 8.107, 8.227]));
    expect(_response.length, equals(15));
  });

  test('Should get traceroute info from the server', () async {
    late final http.Client _httpClient;
    late final IApiUrls _apiUrl;
    late final ITracerouteInfoRepository _iTracerouteRepository;

    /// Inits
    _httpClient = http.Client();
    _apiUrl = ApiUrlImpl();
    _iTracerouteRepository = TracerouteInfoRepositoryImpl(
        remoteTracerouteInfoRepository: RemoteTracerouteInfoDatasourceImpl(
            _httpClient,
            _apiUrl,
            NetWorkInfoImpl(dataConnectionChecker: DataConnectionChecker())));

    final _params = GetTracerouteInfoParams(
      host: 'google.com',
      hopsMaxNumber: 2,
      protocol: Protocol.icmp,
      timeOut: 5,
    );

    final _response = (await _iTracerouteRepository.getTracerouteInfo(_params))
        .fold((l) => l, (r) => r);

    expect(_response, isA<List<TracerouteInfo>>());
    debugPrint((_response as List<TracerouteInfo>).first.hopsIpAdress);
    expect(_response.length, equals(2));
  });
}
