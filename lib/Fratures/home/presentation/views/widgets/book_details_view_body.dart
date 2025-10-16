import 'package:bookely/Fratures/home/data/models/book_model/book_model.dart';
import 'package:bookely/Fratures/home/presentation/views/widgets/book_action.dart';
import 'package:bookely/Fratures/home/presentation/views/widgets/book_rating.dart';
import 'package:bookely/Fratures/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookely/Fratures/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookely/Fratures/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:bookely/constants.dart';
import 'package:bookely/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomBookDetailsAppBar(),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width(context) * .2),
                    child: CustomBookImage(
                      imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
                    ),
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                  Text(
                    bookModel.volumeInfo.title!,
                    style: Styles.textStyle30,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      bookModel.volumeInfo.authors![0],
                      style: Styles.textStyles18.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  BookRating(
                    countRating: bookModel.volumeInfo.ratingsCount ?? 0,
                    rating: bookModel.volumeInfo.averageRating ?? 0,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  const SizedBox(
                    height: 37,
                  ),
                  const BooksAction(),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "You can also see",
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const SimilarBooksListView(),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
