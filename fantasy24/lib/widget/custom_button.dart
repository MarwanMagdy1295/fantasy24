import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container customButton({
  title,
  titleStyle,
  backgroundColor,
  padding,
  shape,
  onTap,
  boxShadow,
  disabledBackgroundColor,
}) {
  return Container(
    width: double.maxFinite,
    decoration: BoxDecoration(
        boxShadow: boxShadow, borderRadius: BorderRadius.circular(8.0.r)),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        padding: padding,
        shape: shape,
      ),
      child: Text(
        title,
        style: titleStyle,
      ),
    ),
  );
}
