import '../../../../../core/utils/query_string.dart';

enum Protocol { udp, icmp }

class GetTracerouteInfoParams implements QueryString {
  String host;
  int hopsMaxNumber;
  int timeOut;
  Protocol protocol;

  GetTracerouteInfoParams(
      {required this.host,
      required this.timeOut,
      required this.hopsMaxNumber,
      required this.protocol});

  String _getProtocol(Protocol protocol) {
    switch (protocol) {
      case Protocol.icmp:
        return 'icmp';
      case Protocol.udp:
        return 'udp';
      default:
        throw Exception('Procol not supported');
    }
  }

  @override
  String toQueryString() =>
      'host=$host&hopsMaxNumber=$hopsMaxNumber&timeOut=$timeOut&protocol=${_getProtocol(protocol)}';
}
