import 'package:dartz/dartz.dart';

import 'package:test_vascomm/api/error/failures.dart';

import 'package:test_vascomm/models/login_model.dart';

import '../api/error/exception.dart';
import '../api/remote_datasource.dart';
import '../repositories/login_repository.dart';
import '../utils/network_info.dart';

class LoginRepositoryImpl implements LoginRepository {
  final NetworkInfoImpl networkInfoImpl;
  final RemoteDataSource remoteDataSource;

  LoginRepositoryImpl({
    required this.networkInfoImpl,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, LoginResponseModel>> login(
      Map<String, dynamic> loginModel) async {
    if (await networkInfoImpl.isConnected) {
      try {
        final response = await remoteDataSource.login(loginModel);
        if (response.data is LoginResponseModel) {
          return Right(response.data);
        } else {
          return const Left(ServerFailure());
        }
      } on ServerException catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(
        ServerFailure('Tidak ada koneksi internet'),
      );
    }
  }
}
