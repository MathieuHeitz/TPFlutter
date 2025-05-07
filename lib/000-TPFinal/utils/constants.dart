import 'package:flutter/material.dart';


class AppColors {
  static const Color primaryColor = Color(0xFF4A55A2);
  static const Color accentColor = Color(0xFF7895CB);
  static const Color lightColor = Color(0xFFA0BFE0);
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color textColor = Color(0xFF333333);
  static const Color taskTileColor = Colors.white;
  static const Color taskDoneColor = Color(0xFF9AE19D);
}

class AppTextStyles {
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );
}

class AppDecorations {
  static BoxDecoration taskTileDecoration = BoxDecoration(
    color: AppColors.taskTileColor,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  );
}
