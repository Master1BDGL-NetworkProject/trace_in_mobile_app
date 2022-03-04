import 'package:validators/validators.dart' as validators;

class TextFieldValidators {
  /// Check whether a value is a [host] or [ip]
  static String? isHost(String? value, [String? label]) {
    if (validators.isIP(value) || validators.isURL(value)) {
      return null;
    }
    return 'Entrer un host/Adresse IP valide';
  }

  static String? isNumber(String? value, [String? label]) {
    return validators.isNumeric(value!)
        ? null
        : 'Entrer un ${label ?? 'nombre'} ';
  }
}
