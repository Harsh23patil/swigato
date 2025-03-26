import 'package:fpdart/src/either.dart';
import 'package:swigato/core/error/failures.dart';
import 'package:swigato/core/usecase/usecase.dart';
import 'package:swigato/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<String, UserSignUpParam> {
  final AuthRepository authRepository;

  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUpParam params) async {
    // TODO: implement call
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParam {
  final String name;
  final String email;
  final String password;

  UserSignUpParam({
    required this.name,
    required this.email,
    required this.password,
  });
}
