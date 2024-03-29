import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes.dart';
import 'package:mvvm_app/utils/routes/routes_name.dart';
import 'package:mvvm_app/view_model/AuthViewModel.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesNames.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
