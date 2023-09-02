import 'package:dartz/dartz.dart';
import 'package:test_vascomm/models/login_model.dart';

import '../api/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginResponseModel>> login(
      Map<String, dynamic> loginModel);
}
