// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AppText extends StatelessWidget {
//   const AppText({
//     super.key,
//     this.title = "Bexit App",
//     this.color,
//     this.decoration = TextDecoration.none,
//     this.size,
//     this.fontWeight,
//     this.fontFamily,
//     this.textAlign,
//     this.height,
//     this.letterSpacing,
//     this.maxLines,
//     this.overFlow,
//     this.fontStyle,
//     this.softWrap,
//     this.textWidthBasis,
//     this.decorationStyle,
//   });

//   final Color? color;
//   final TextOverflow? overFlow;
//   final String title;
//   final double? size;
//   final double? height;
//   final FontWeight? fontWeight;
//   final TextDecoration decoration;
//   final FontStyle? fontStyle;
//   final String? fontFamily;
//   final TextAlign? textAlign;
//   final double? letterSpacing;
//   final int? maxLines;
//   final bool? softWrap;
//   final TextWidthBasis? textWidthBasis;
//   final TextDecorationStyle? decorationStyle;
//   @override
//   Widget build(BuildContext context) {
//     // Get the current theme
//     final ThemeData theme = Theme.of(context);

//     // Determine the text color based on the theme mode
//     final Color textColor = color ?? theme.textTheme.bodyLarge!.color!;

//     return Text(
//       title,
//       style: GoogleFonts.mulish(
//         textStyle: TextStyle(
//           color: textColor,
//           fontSize: size,
//           height: height,
//           fontStyle: fontStyle,
//           fontWeight: fontWeight,
//           decoration: decoration,
//           decorationColor: color,
//           letterSpacing: letterSpacing,
//           fontFamily: fontFamily,
//           decorationStyle: decorationStyle,
//         ),
//       ),
//       softWrap: softWrap,
//       overflow: overFlow,
//       textAlign: textAlign,
//       maxLines: maxLines,
//       textWidthBasis: textWidthBasis,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    this.title = "Bexit App",
    this.color,
    this.decoration = TextDecoration.none,
    this.size,
    this.fontWeight,
    this.fontFamily = "Inter",
    this.textAlign,
    this.height,
    this.letterSpacing,
    this.maxLines,
    this.overFlow,
    this.fontStyle,
    this.softWrap,
    this.textWidthBasis,
    this.decorationStyle,
  });

  final Color? color;
  final TextOverflow? overFlow;
  final String title;
  final double? size;
  final double? height;
  final FontWeight? fontWeight;
  final TextDecoration decoration;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final bool? softWrap;
  final TextWidthBasis? textWidthBasis;
  final TextDecorationStyle? decorationStyle;

  TextStyle getGoogleFontStyle() {
    TextStyle baseStyle = TextStyle(
      color: color,
      fontSize: size,
      height: height,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      decoration: decoration,
      decorationColor: color,
      letterSpacing: letterSpacing,
      decorationStyle: decorationStyle,
    );

    switch (fontFamily?.toLowerCase()) {
      case "poppins":
        return GoogleFonts.poppins(textStyle: baseStyle);
      case "mulish":
        return GoogleFonts.mulish(textStyle: baseStyle);
      case "roboto":
        return GoogleFonts.roboto(textStyle: baseStyle);
      case "Inter":
        return GoogleFonts.inter(textStyle: baseStyle);
      // Add more fonts here as needed
      default:
        return GoogleFonts.mulish(textStyle: baseStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color textColor = color ?? theme.textTheme.bodyLarge!.color!;

    return Text(
      title,
      style: getGoogleFontStyle().copyWith(color: textColor),
      softWrap: softWrap,
      overflow: overFlow,
      textAlign: textAlign,
      maxLines: maxLines,
      textWidthBasis: textWidthBasis,
    );
  }
}
