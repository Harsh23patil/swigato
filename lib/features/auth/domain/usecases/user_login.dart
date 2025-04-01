import 'package:fpdart/fpdart.dart';
import 'package:swigato/core/entities/user.dart';
import 'package:swigato/core/error/failures.dart';
import 'package:swigato/core/usecase/usecase.dart';
import 'package:swigato/features/auth/domain/repository/auth_repository.dart';

class UserLogin implements UseCase<User, UserLogInParam> {
  final AuthRepository authRepository;

  const UserLogin(this.authRepository);
  @override
  Future<Either<Failure, User>> call(UserLogInParam params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLogInParam {
  final String email;
  final String password;

  UserLogInParam({
    required this.email,
    required this.password,
  });
}
