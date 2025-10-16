import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/utils/styles.dart';

class BookRating extends StatelessWidget {
  BookRating(
      {super.key,
      mainAxisAlignment = MainAxisAlignment.center,
      required this.countRating,
      required this.rating});
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center;
  final num rating;
  final num countRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4f),
          size: 14,
        ),
        const SizedBox(
          width: 6.3,
        ),
        Text("$rating", style: Styles.textStyle16),
        Opacity(
          opacity: .5,
          child: Text("($countRating)", style: Styles.textStyle14.copyWith()),
        )
      ],
    );
  }
}
