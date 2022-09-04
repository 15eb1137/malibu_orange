import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: GestureDetector(
              onTap: () => context.go('/brightness'),
              child: Image.asset('assets/images/malibu_orange_title.png',
                  fit: BoxFit.cover))));
}
