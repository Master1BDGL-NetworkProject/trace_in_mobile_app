class TracerouteInfo {
  int hopsNumber;
  String hopsIpAdress;
  List<double> packetTime;

  TracerouteInfo(
      {required this.hopsNumber,
      required this.hopsIpAdress,
      required this.packetTime});
}
