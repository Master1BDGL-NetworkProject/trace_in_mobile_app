import 'package:validators/validators.dart';

extension StringValidators on String {
  bool isIpAdress() {
    return isIP(this);
  }
}
