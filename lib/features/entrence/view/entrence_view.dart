import 'package:skill_assessment/app_library.dart';

class EntrenceView extends StatefulWidget {
  const EntrenceView({super.key});

  @override
  State<EntrenceView> createState() => _EntrenceViewState();
}

class _EntrenceViewState extends State<EntrenceView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: AppPaddings.commonSymmetricPadding,
          child: FittedBox(
            child: AppSvgImage(
              assetName: AppSvgs.logo,
              width: 51.w,
              height: 40.h,
            ),
          ),
        ),
        // leadingWidth: 160.w,
        toolbarHeight: 60,

      ),
      body: const BackgroundShedowEffect(child:  GenerateTokenCard(),),
    );
  }
}