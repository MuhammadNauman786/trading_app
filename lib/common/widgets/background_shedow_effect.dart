import 'package:skill_assessment/app_library.dart';


class BackgroundShedowEffect extends StatelessWidget {
  const BackgroundShedowEffect({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: AppColors.secondaryColor.withOpacity(0.1),
                    blurRadius: 1000.r,
                    spreadRadius: 1.r
                )
              ]
          ),
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             child
            ],
          ),
        ),
      ],
    );
  }
}
