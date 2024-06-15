import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppPaddings {
  static final commonLeftPadding = EdgeInsets.only(left: 16.w);
  static final commonRightPadding = EdgeInsets.only(right: 16.w);
  static final commonTopPadding = EdgeInsets.only(top: 16.w);
  static final commonBottomPadding = EdgeInsets.only(bottom: 16.w);
  static final commonHorizontalPadding = EdgeInsets.symmetric(horizontal: 16.w);
  static final commonVerticallPadding = EdgeInsets.symmetric(vertical: 16.h);
  static final commonSymmetricPadding = EdgeInsets.symmetric(
    horizontal: 16.w,
    vertical: 16.h,
  );
  static final commonPaddingNotBottom = EdgeInsets.only(
    top: 16.h,
    left: 16.w,
    right: 16.w,
  );
}
