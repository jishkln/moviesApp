import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: 'Hot & New')),
      body: SafeArea(child: Center(child: Text("New & Hot"))),
    );
  }
}
