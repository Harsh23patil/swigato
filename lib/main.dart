import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:swigato/core/secrets/app_secrets.dart';
import 'package:swigato/core/theme/theme.dart';
import 'package:swigato/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:swigato/features/auth/data/repository/auth_repository_impl.dart';
import 'package:swigato/features/auth/domain/repository/auth_repository.dart';
import 'package:swigato/features/auth/domain/usecases/user_sign_up.dart';
import 'package:swigato/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:swigato/features/auth/presentation/pages/login.dart';
import 'package:swigato/features/auth/presentation/pages/sign_up.dart';
import 'package:swigato/features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supbase = await Supabase.initialize(
    url: AppSecrets.supbaseUrl,
    anonKey: AppSecrets.supbaseAnonKey,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignUp: UserSignUp(
            AuthRepositoryImpl(
              AuthRemoteDataSourceImpl(supbase.client),
            ),
          ),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.lightThemeMode,
      home: const HomePage(),
    );
  }
}
