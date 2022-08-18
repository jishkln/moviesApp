import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/scearch/widget/search_result.dart';
import 'package:netflix/presentation/scearch/widget/state_idle.dart';
import 'package:netflix/presentation/scearch/widget/title.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kHight,
              const Expanded(child: SearchResultWidget())

              // const Expanded(child: SearchIdleWidget())
            ],
          ),
        )),
      ),
    );
  }
}
