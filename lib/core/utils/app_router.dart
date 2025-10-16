import 'package:bookely/Fratures/home/data/models/book_model/book_model.dart';
import 'package:bookely/Fratures/home/data/repos/home_repo_impl.dart';
import 'package:bookely/Fratures/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookely/Fratures/home/presentation/views/home_view.dart';
import 'package:bookely/Fratures/splash/presentation/views/splash_view.dart';
import 'package:bookely/core/utils/server_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Fratures/home/presentation/views/book_details_view.dart';

abstract class AppRouter {
  static const kBookDetails = "/bookDetails";
  static final router = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: "/homeView",
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: "/bookDetails",
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(
          getIt.get<HomeRepoImpl>(),
        ),
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    )
  ]);
}
