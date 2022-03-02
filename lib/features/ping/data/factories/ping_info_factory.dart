import '../../domain/entities/ping_info.dart';

class PingInfoFactory extends PingInfo {
  PingInfoFactory(
      {required int bits,
      required String host,
      required int sequenceNo,
      required double time,
      required int ttl})
      : super(
            bits: bits,
            host: host,
            sequenceNo: sequenceNo,
            time: time,
            ttl: ttl);

  factory PingInfoFactory.fromJson(Map<String, dynamic> json) =>
      PingInfoFactory(
          bits: int.tryParse(json['bits']) ?? 0,
          host: json['host'],
          sequenceNo: int.tryParse(json['sequenceNo']) ?? 0,
          time: double.tryParse(json['time']) ?? 0.0,
          ttl: int.tryParse(json['ttl']) ?? 0);
}
