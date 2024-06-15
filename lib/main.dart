
import 'app_library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = MediaQuery.of(context).size.width;
        final double screenHeight = MediaQuery.of(context).size.height;

        bool isMobile = isMobileDevice(screenWidth, screenHeight);

        return ScreenUtilInit(
            designSize: Size(constraints.maxWidth, constraints.maxHeight),
            minTextAdapt: true,
            splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'KingSwap',
              theme: AppTheme.baseTheme,
              home: const EntrenceView(),
            );
          }
        );
      }
    );
  }

  bool isMobileDevice(double width, double height) {
    // Example thresholds, adjust as needed
    return width < 600 && height < 800;
  }
}


