import 'package:eqraa/Core/utlis/styles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;

  const MainButton(
      {super.key, required this.innerText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xff233743),
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          innerText,
          style: AppStyles.textStyle14.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
