abstract class IApiUrls {
  /// Get url of pIng
  String get pingUrl;

  /// Get url of pIng
  String get tracerouteUrl;
}

class ApiUrlImpl implements IApiUrls {
  final String _pingUrl = 'http://52.91.105.103:8080/ping';
  final String _tracerouteUrl = 'http://52.91.105.103:8080/traceroute';

  @override
  String get pingUrl => _pingUrl;

  @override
  String get tracerouteUrl => _tracerouteUrl;
}
