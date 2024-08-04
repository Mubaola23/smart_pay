import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NumberBtnUi extends StatelessWidget {
  const NumberBtnUi({
    super.key,
    required this.text,
    required this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.isIcon = false,
    this.iconString,
  });
  final String text;
  final bool isIcon;
  final String? iconString;
  final VoidCallback onTap;
  final VoidCallback? onTapDown;
  final VoidCallback? onTapUp;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.red,
      onTap: onTap,
      onTapDown: (_) => onTapUp,
      onTapUp: (_) => onTapDown,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: isIcon
              ? SvgPicture.asset(iconString!)
              : Text(
                  text,
                  style: const TextStyle(
                    color: Color(0xFF16224A),
                    fontSize: 24,
                    fontFamily: 'Work Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
