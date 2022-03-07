import '../../domain/entities/traceroute_info.dart';

class TracerouteInfoFactory extends TracerouteInfo {
  TracerouteInfoFactory(
      {required int hopsNumber,
      required String hopsIpAdress,
      required List<double> packetTime})
      : super(
            hopsIpAdress: hopsIpAdress,
            hopsNumber: hopsNumber,
            packetTime: packetTime);

  factory TracerouteInfoFactory.fromJson(Map<String, dynamic> json) =>
      TracerouteInfoFactory(
          hopsNumber: int.tryParse(json['hopsNumber']) ?? 0,
          hopsIpAdress: json['hopsIpAdress'],
          packetTime: (json['packetTime'] as List)
              .map((_packetTime) =>
                  double.tryParse(_packetTime.toString()) ?? 0.0)
              .toList());
}
