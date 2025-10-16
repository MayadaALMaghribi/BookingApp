import 'package:bloc/bloc.dart';
import 'package:bookely/Fratures/home/data/models/book_model/book_model.dart';
import 'package:bookely/Fratures/home/data/repos/home_repo.dart';

import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeatureBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeautredBooks();

    result.fold((failure) {
      emit(
        FeaturedBooksFailure(failure.errMessage),
      );
    }, (books) {
      emit(
        FeaturedBooksSucess(books),
      );
    });
  }
}
