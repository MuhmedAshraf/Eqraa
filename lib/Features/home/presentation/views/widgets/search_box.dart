import 'package:eqraa/Core/utlis/colors.dart';
import 'package:eqraa/Core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/book_cubit/book_cubit.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 13.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 226, 226, 226),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Write the title or author of the book",
              hintStyle: AppStyles.textStyle14,
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,

                ),
                onPressed: () {
                  final query = controller.text;
                  if (query.isNotEmpty) {
                    context.read<BookCubit>().searchBooks(query);
                  }
                },
              ),

            ),
          ),
        ));
  }
}
