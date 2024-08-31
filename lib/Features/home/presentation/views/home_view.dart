import 'package:eqraa/Features/home/presentation/views/widgets/custom_drawer.dart';
import 'package:eqraa/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../Core/utlis/colors.dart';
import '../../../../Core/utlis/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBar,
        title: const Text(
          'EQRAA',
          style: AppStyles.title18,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const CustomDrawer(),
      body: const HomeViewBody(),
    );
  }
}
