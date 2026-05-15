import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class RatingWidget extends StatelessWidget {
  final int rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          size: 18,
          color: index < rating ? AppColors.primary : Colors.grey.shade700,
        ),
      ),
    );
  }
}
