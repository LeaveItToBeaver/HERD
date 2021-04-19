import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herd/blocs/auth/auth_bloc.dart';
import 'package:herd/config/custom_router.dart';
import 'package:herd/repositories/auth/auth_repository.dart';
import 'package:herd/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Herd());
}

class Herd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //context.read<AuthRepository>();
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(
            create: (_) => AuthRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
                create: (context) =>
                    AuthBloc(authRepository: context.read<AuthRepository>())),
          ],
          child: MaterialApp(
            title: 'Herd',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            onGenerateRoute: CustomRouter.onGeneratedRoute,
            initialRoute: SplashScreen.routeName,
          ),
        ));
  }
}