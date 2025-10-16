import 'package:bloc/bloc.dart';
import 'package:bookely/Fratures/home/data/models/book_model/book_model.dart';
import 'package:bookely/Fratures/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepo) : super(BestSellerBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeatureBastSeller() async {
    emit(BestSellerBooksLoading());
    var result = await homeRepo.fetchBestSellerBook();
    result.fold((failure) {
      emit(
        BestSellerBooksfailure(failure.errMessage),
      );
    }, (books) {
      emit(
        BestSellerBooksSucess(books),
      );
    });
  }
}
