import 'package:dartz/dartz.dart';

abstract class Usescase<Params, Response> {
  Future<Either<Exception, Response>> trigger(Params p);
}
