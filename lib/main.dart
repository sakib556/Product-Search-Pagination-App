import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubit/product/product_cubit.dart';
import 'package:grocery_app/cubit/product_details/product_details_cubit.dart';
import 'package:grocery_app/repository/product_repo.dart';
import 'package:grocery_app/views/screens/search/search_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => ProductCubit(ProductRepo()),
      ),
      BlocProvider(
        create: (_) => ProductDetailsCubit(ProductRepo()),
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
