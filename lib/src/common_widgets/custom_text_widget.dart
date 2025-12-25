import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eppsee/src/core/extensions/app_extension.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Widget? icon;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final int? maxLength;
  final TextDecoration? decoration;
  final Color? color;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? fontSize;
  final TextStyle? style;
  final double? blurRadius;
  final Color? shadowColor;
  final Offset? shadowOffset;
  final double? decorationThickness;
  final Color? decorationColor;
  final double? underlineSpacing;
  final FontStyle? fontStyle;

  const CustomTextWidget({
    required this.text,
    super.key,
    this.textAlign,
    this.icon,
    this.overflow,
    this.maxLines,
    this.maxLength,
    this.decoration,
    this.color,
    this.fontWeight,
    this.letterSpacing,
    this.wordSpacing,
    this.fontStyle,
    this.fontSize,
    this.style,
    this.blurRadius,
    this.shadowColor,
    this.shadowOffset,
    this.underlineSpacing,
    this.decorationThickness,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: underlineSpacing ?? 0),
        child: Text(
          text,

          style: style ??
              GoogleFonts.inter(
                color: color,
                fontWeight: fontWeight,
                decoration: decoration,
                decorationThickness: decorationThickness,
                decorationColor: decorationColor,
                letterSpacing: letterSpacing,
                wordSpacing: wordSpacing,
                fontStyle: fontStyle ?? FontStyle.normal,
                fontSize: context.scaleFont(fontSize ?? 14),
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: blurRadius ?? 00.0, // Use provided blurRadius, or default to 10.0
                    color: shadowColor ??
                        Colors.black.withValues(
                          alpha: 0,
                        ), // Use provided shadowColor, or default to black with opacity
                    offset: shadowOffset ?? const Offset(0.0, 0.0), // Use dynamic shadowOffset
                  ),
                ],
              ),
          textAlign: textAlign,
          overflow: overflow ?? TextOverflow.ellipsis,
          maxLines: maxLines ?? 1000,

          // maxLength: widget.maxLength,
        ),
      );
}
