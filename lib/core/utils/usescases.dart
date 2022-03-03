import 'package:dartz/dartz.dart';

abstract class Usescase<Params, Response> {
  Future<Either<Exception, Response>> trigger(Params params);
}

abstract class NonFutureUsescase<Params, Response> {
  Either<Exception, Response> trigger(Params params);
}
