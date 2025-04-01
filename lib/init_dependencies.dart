import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swigato/core/secrets/app_secrets.dart';
import 'package:swigato/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:swigato/features/auth/data/repository/auth_repository_impl.dart';
import 'package:swigato/features/auth/domain/repository/auth_repository.dart';
import 'package:swigato/features/auth/domain/usecases/user_login.dart';
import 'package:swigato/features/auth/domain/usecases/user_sign_up.dart';
import 'package:swigato/features/auth/presentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supbase = await Supabase.initialize(
    url: AppSecrets.supbaseUrl,
    anonKey: AppSecrets.supbaseAnonKey,
  );

  serviceLocator.registerLazySingleton(
    () => supbase.client,
  );
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
      ),
    );
}
