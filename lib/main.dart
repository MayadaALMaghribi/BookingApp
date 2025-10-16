import 'package:bookely/Fratures/home/data/repos/home_repo_impl.dart';
import 'package:bookely/Fratures/home/presentation/manager/best_seller_books_cubit/best_seller_books_cubit.dart';
import 'package:bookely/Fratures/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookely/constants.dart';
import 'package:bookely/core/utils/app_router.dart';
import 'package:bookely/core/utils/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) => BestSellerBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeatureBastSeller(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
/**
 *  return MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),

    );
  }
}

 */