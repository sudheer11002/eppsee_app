import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_dimens.dart';
import 'custom_text_widget.dart';

class CustomButtonWidget extends StatefulWidget {
  final String text;
  final Future<void> Function()? onPress;
  final VoidCallback? onTap;

  // Appearance
  final Color buttonColor;
  final Color textColor;
  final Color? borderColor;
  final double borderRadius;
  final double elevation;
  final double height;
  final double? width;
  final double borderWidth;

  // Text
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final bool expandText;
  final int textFlex;

  // Icon/Image
  final IconData? icon;
  final Color? iconColor;
  final String imagePath;
  final double imageSize;
  final Color? imageColor;
  final bool isIconRight;

  // Padding
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingLeft;
  final double? paddingRight;

  // Text internal padding
  final double textPaddingH;
  final double textPaddingV;

  // Loading & Feedback
  final bool isLoading;
  final bool enableTapAnimation;
  final bool enableHapticFeedback;

  // Gradient
  final Gradient? gradient;

  const CustomButtonWidget({
    required this.text,
    super.key,
    this.onPress,
    this.onTap,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderColor,
    this.borderRadius = 10,
    this.elevation = 0,
    this.height = AppDimens.size46,
    this.width,
    this.borderWidth = 1.5,
    this.fontSize = AppDimens.size16,
    this.fontWeight = FontWeight.w600,
    this.textAlign = TextAlign.center,
    this.expandText = true,
    this.textFlex = 1,
    this.icon,
    this.iconColor = Colors.white,
    this.imagePath = "",
    this.imageSize = 20,
    this.imageColor,
    this.isIconRight = false,
    this.padding,
    this.margin,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
    this.textPaddingH = 0,
    this.textPaddingV = 0,
    this.isLoading = false,
    this.enableTapAnimation = true,
    this.enableHapticFeedback = true,
    this.gradient,
  });

  @override
  State<CustomButtonWidget> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<CustomButtonWidget> {
  double _scale = 1.0;

  void _handleTap() async {
    if (widget.enableHapticFeedback) {
      HapticFeedback.lightImpact();
    }

    if (widget.onTap != null) {
      widget.onTap!();
    }

    if (widget.onPress != null) {
      await widget.onPress!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = widget.width ?? MediaQuery.of(context).size.width;

    Widget buildIconOrImage() {
      if (widget.imagePath.isNotEmpty) {
        return Image.asset(
          widget.imagePath,
          width: widget.imageSize,
          height: widget.imageSize,
          color: widget.imageColor,
        );
      } else if (widget.icon != null) {
        return Icon(
          widget.icon,
          size: widget.imageSize,
          color: widget.iconColor,
        );
      }
      return const SizedBox();
    }

    final childContent = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!widget.isIconRight) buildIconOrImage(),
        if (!widget.isIconRight && (widget.icon != null || widget.imagePath.isNotEmpty))
          const SizedBox(width: 8),
        if (widget.expandText)
          Expanded(
            flex: widget.textFlex,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.textPaddingH,
                vertical: widget.textPaddingV,
              ),
              child: CustomTextWidget(
                text: widget.text,
                textAlign: widget.textAlign,
                overflow: TextOverflow.ellipsis,
                fontWeight: widget.fontWeight,
                fontSize: widget.fontSize,
                color: widget.textColor,
              ),
            ),
          )
        else
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.textPaddingH,
              vertical: widget.textPaddingV,
            ),
            child: CustomTextWidget(
              text: widget.text,
              textAlign: widget.textAlign,
              overflow: TextOverflow.ellipsis,
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
              color: widget.textColor,
            ),
          ),
        if (widget.isIconRight && (widget.icon != null || widget.imagePath.isNotEmpty))
          const SizedBox(width: 8),
        if (widget.isIconRight) buildIconOrImage(),
      ],
    );

    final buttonBody = Container(
      width: buttonWidth,
      height: widget.height,
      padding: widget.padding ??
          EdgeInsets.only(
            top: widget.paddingTop ?? 0,
            bottom: widget.paddingBottom ?? 0,
            left: widget.paddingLeft ?? 0,
            right: widget.paddingRight ?? 0,
          ),
      margin: widget.margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: widget.gradient,
        color: widget.buttonColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: widget.borderColor ?? widget.buttonColor,
          width: widget.borderWidth,
        ),
      ),
      child: childContent,
    );

    return GestureDetector(
      onTapDown: (_) {
        if (widget.enableTapAnimation) {
          setState(() {
            _scale = 0.96;
          });
        }
      },
      onTapUp: (_) async {
        if (widget.enableTapAnimation) {
          setState(() {
            _scale = 1.0;
          });
        }
        _handleTap();
      },
      onTapCancel: () {
        if (widget.enableTapAnimation) {
          setState(() {
            _scale = 1.0;
          });
        }
      },
      child: Transform.scale(
        scale: _scale,
        child: Material(
          elevation: widget.elevation,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: buttonBody,
        ),
      ),
    );
  }
}
