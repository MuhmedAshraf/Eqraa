import 'package:eqraa/Features/home/presentation/view_model/book_cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'Features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Eqraa());
}

class Eqraa extends StatelessWidget {
  const Eqraa({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}


