import 'package:flutter/material.dart';
import '../../../../../Core/utlis/colors.dart';
import '../../../../../Core/utlis/styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBar,
      height: 48,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
                print('ok');
              },
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.white,
                size: 20,
              )),
          const Spacer(
            flex: 1,
          ),
          const Text(
            'ReadIt',
            style: AppStyles.title18,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
