import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/product/product_bloc.dart';
import 'package:grocery_app/bloc/product_details/product_details_bloc.dart';
import 'package:grocery_app/repository/product_repo.dart';
import 'package:grocery_app/views/screens/search/search_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => ProductBloc(ProductRepo()),
      ),
      BlocProvider(
        create: (_) => ProductDetailsBloc(ProductRepo()),
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SearchScreen(),
    );
  }
}
