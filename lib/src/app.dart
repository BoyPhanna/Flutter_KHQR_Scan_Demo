import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_bangking_ap/src/bloc/home/home_bloc.dart';
import 'package:qr_bangking_ap/src/screens/home/home_screen.dart';
import 'package:qr_bangking_ap/src/screens/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider(create: (context) => HomeBloc());
    return MultiBlocProvider(
      providers: [homeBloc],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoute.all,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
