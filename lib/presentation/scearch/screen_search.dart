import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/domain/core/debouncer/debouncer.dart';
import 'package:netflix/presentation/scearch/widget/search_result.dart';
import 'package:netflix/presentation/scearch/widget/state_idle.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _debouncer = Debouncer(millisecons: 1 * 1000);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(
        const initialize(),
      );
    });
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
                onChanged: (value) {
                  if (value.isEmpty) {
                    return;
                  }
                  _debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context).add(
                      searchMovie(movieQuery: value),
                    );
                  });
                },
              ),
              kHight,
              //const Expanded(child: SearchResultWidget())

              Expanded(child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return const SearchIdleWidget();
                  } else {
                    return const SearchResultWidget();
                  }
                },
              ))
            ],
          ),
        )),
      ),
    );
  }
}
