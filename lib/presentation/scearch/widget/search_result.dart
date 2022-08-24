import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/presentation/scearch/widget/title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: "Movies & TV",
        ),
        kHight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                children: List.generate(20, (index) {
                  final movie = state.searchResultList[index];
                  return MainCard(
                      imageUrl: '$imageAppentUrl${movie.posterPath}');
                }),
              );
            },
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key, required this.imageUrl}) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              imageUrl,
            ),
            fit: BoxFit.cover),
        borderRadius: kRadius10,
      ),
    );
  }
}
