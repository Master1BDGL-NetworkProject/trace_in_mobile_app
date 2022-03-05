import 'package:data_connection_checker_tv/data_connection_checker.dart';

import './network_info_interface.dart';

class NetWorkInfoImpl implements INetworkInfo {
  final DataConnectionChecker _dataConnectionChecker;
  NetWorkInfoImpl({required DataConnectionChecker dataConnectionChecker})
      : _dataConnectionChecker = dataConnectionChecker;

  @override
  Future<bool> get hasConnection async =>
      await _dataConnectionChecker.hasConnection;
}
