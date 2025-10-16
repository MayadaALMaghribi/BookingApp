part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksSucess extends FeaturedBooksState {
  final List<BookModel> resbooks;
  const FeaturedBooksSucess(this.resbooks);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  final String errormessage;

  const FeaturedBooksFailure(this.errormessage);
}
