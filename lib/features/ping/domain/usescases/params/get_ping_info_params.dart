import '../../../../../core/utils/query_string.dart';

class GetPingInfoParams implements QueryString {
  String host;
  int packetsNu;
  int packetSize;
  int ttl;
  int timeOut;

  GetPingInfoParams(
      {required this.host,
      required this.packetSize,
      required this.packetsNu,
      required this.timeOut,
      required this.ttl});

  @override
  String toQueryString() =>
      'host=$host&packetsNu=$packetsNu&packetSize=$packetSize&ttl=$ttl&timeOut=$timeOut';
}
