import 'package:flutter/material.dart';

import 'home_view_body_appbar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [HomeViewBodyAppBAr()],
    );
  }
}
