import 'package:skill_assessment/app_library.dart';


class BoxDeco{
  static final BoxDecoration baseCardDecoration = BoxDecoration(
      color: AppColors.secondaryColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(2.r),
      border: Border.all(
        color: AppColors.secondaryColor.withOpacity(0.15),
      )
  );
}