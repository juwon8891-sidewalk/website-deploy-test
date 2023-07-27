part of styles;

class FontTheme {
  static TextStyle get thin => TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w300,
        fontSize: 20.spMin,
      );

  static TextStyle get normal => TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w400,
        fontSize: 20.spMin,
      );

  static TextStyle get bold => TextStyle(
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w800,
        fontSize: 20.spMin,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
    FontStyle? fontStyle,
    double? height,
    TextDecoration? decoration,
    Color? decorationColor,
    Paint? foreground,
    double? letterSpacing,
    TextLeadingDistribution? textLeadingDistribution,
    TextOverflow? overflow,
    double? wordSpacing,
    List<Shadow>? shadows,
  }) =>
      TextStyle(
          fontFamily: fontFamily,
          color: color ?? this.color,
          fontSize: fontSize ?? this.fontSize,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle,
          height: height ?? this.height,
          decoration: decoration ?? this.decoration,
          decorationColor: decorationColor ?? this.decorationColor,
          foreground: foreground ?? this.foreground,
          letterSpacing: letterSpacing ?? this.letterSpacing,
          overflow: overflow ?? this.overflow,
          leadingDistribution: textLeadingDistribution ?? leadingDistribution,
          wordSpacing: wordSpacing ?? this.wordSpacing,
          shadows: shadows ?? this.shadows);
}
