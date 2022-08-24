import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/downloads/downloads_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/application/home/home_bloc.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/application/search/search_bloc.dart';
import 'package:netflix/core/colors/colores.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ((context) => getIt<DownloadsBloc>()),
        ),
         BlocProvider(
          create: ((context) => getIt<SearchBloc>()),
        ),
         BlocProvider(
          create: ((context) => getIt<FastLaughBloc>()),
        ),
         BlocProvider(
          create: ((context) => getIt<HotAndNewBloc>()),
        ),
         BlocProvider(
          create: ((context) => getIt<HomeBloc>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NetFlix',
        theme: ThemeData(
            scaffoldBackgroundColor: backgrountColor,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            )),
        home: ScreenMainPage(),
      ),
    );
  }
}
