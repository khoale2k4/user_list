import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class MyCustomThemeExtension extends ThemeExtension<MyCustomThemeExtension> {
  const MyCustomThemeExtension({
    required this.brandColor,
    required this.textColor,
    this.specialTextSize,
  });

  final Color brandColor;
  final Color textColor;
  final double? specialTextSize; // Có thể null

  // Tạo một bản sao với các giá trị mới
  @override
  MyCustomThemeExtension copyWith(
      {Color? brandColor, Color? textColor, double? specialTextSize}) {
    return MyCustomThemeExtension(
      brandColor: brandColor ?? this.brandColor,
      textColor: textColor ?? this.textColor,
      specialTextSize: specialTextSize ?? this.specialTextSize,
    );
  }

  // Nội suy giữa hai ThemeExtension (quan trọng cho animations và transitions)
  @override
  MyCustomThemeExtension lerp(
      covariant ThemeExtension<MyCustomThemeExtension>? other, double t) {
    if (other is! MyCustomThemeExtension) {
      return this;
    }
    return MyCustomThemeExtension(
      brandColor: Color.lerp(brandColor, other.brandColor, t)!,
      textColor: Color.lerp(textColor, other.textColor, t)!,
      specialTextSize: lerpDouble(specialTextSize, other.specialTextSize, t),
    );
  }
}

ThemeData getTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    extensions: const <ThemeExtension<dynamic>>[
      // Thêm extension vào đây
      MyCustomThemeExtension(
        brandColor: Colors.purple,
        textColor: Colors.white10,
        specialTextSize: 24.0,
      ),
    ],
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    // Nếu có dark theme
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple, brightness: Brightness.dark),
    useMaterial3: true,
    extensions: const <ThemeExtension<dynamic>>[
      MyCustomThemeExtension(
        brandColor: Colors.deepOrange, // Màu khác cho dark theme
        textColor: Colors.purple,
        specialTextSize: 28.0,
      ),
    ],
  );
}
