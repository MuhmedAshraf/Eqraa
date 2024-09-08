import 'package:dio/dio.dart';
import 'package:eqraa/Core/api_helper/dio_consumer.dart';
import 'package:eqraa/Features/home/data/repo/book_repo/home_repo_implement.dart';
import 'package:eqraa/Features/home/presentation/view_model/book_cubit/book_cubit.dart';
import 'package:flutter/material.dart';
import 'Features/home/presentation/view_model/favorite_cubit/favorite_cubit.dart';
import 'Features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Eqraa());
}

class Eqraa extends StatelessWidget {
  const Eqraa({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => BookCubit(
                repo: HomeRepoImplement(api: DioConsumer(dio: Dio())))),
        BlocProvider(
          create: (context) => FavoritesCubit()..loadFavorites(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
