class PingInfo {
  int bits;
  String host;
  int sequenceNo;
  double time;
  int ttl;

  PingInfo(
      {required this.bits,
      required this.host,
      required this.sequenceNo,
      required this.time,
      required this.ttl});
}
