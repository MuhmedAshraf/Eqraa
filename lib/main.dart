import 'package:flutter/material.dart';
import 'Features/home/presentation/views/home_view.dart';

void main() {
  runApp( const Eqraa());
}
class Eqraa extends StatelessWidget {
  const Eqraa({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}


