import 'package:skill_assessment/app_library.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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

        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*50/100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDeco.baseCardDecoration,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                "0xEA589c81d6a7567b5bde8048701E038832fe64w7  ",
                                style: GoogleFonts.ibmPlexMono(
                                    fontSize: 12.sp,
                                    color: AppColors.whiteColor.withOpacity(0.5)
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const EntrenceView()));
                              },
                                child: const Icon(Icons.logout, color: AppColors.whiteColor,
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],

      ),
      body: BackgroundShedowEffect(
        child:  Flexible(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth <= 720 ? SmallView(constraints: constraints) : constraints.maxWidth >= 991? FullView() : MediumView(constraints: constraints,);
            }
          ),
        ),
    ));
  }
}

class FullView extends StatelessWidget {
  const FullView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.commonSymmetricPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(child: HoldingsSection()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: const GenerateTokenCard(king: AppSvgs.king,),
          ),
          const Flexible(child: ActiveTradesSection()),
        ],
      ),
    );
  }
}

class MediumView extends StatelessWidget {
  const MediumView({super.key, this.constraints});
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.commonSymmetricPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: HoldingsSection(constraints: constraints)),
                SizedBox(
                  width: 18.w,
                ),
                GenerateTokenCard(constraints: constraints,king: AppSvgs.king,),
              ],
            ),
          ),
          SizedBox(
            height: 18.w,
          ),
          Flexible(flex: 5,child: ActiveTradesSection(contraints: constraints,)),
        ],
      ),
    );
  }
}

class SmallView extends StatelessWidget {
  const SmallView({super.key, this.constraints});
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.commonSymmetricPadding,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HoldingsSectionHorizontal(constraints: constraints),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 18.w),
                child: const GenerateTokenCard(king: AppSvgs.king,),
              ),
              ActiveTradesSection(contraints: constraints, fromSmallView: true,),
            ],
          ),
        ),
      ),
    );
  }
}


class HoldingsSection extends StatelessWidget {
  const HoldingsSection({super.key, this.constraints});
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(
          minWidth: 90.w,
          maxHeight: constraints != null? height*50/100 : height <= 150? height : height <= 800? height*60/100 : 511.h,
          minHeight: 50.h,
          maxWidth: constraints != null? constraints!.maxWidth : 280.w
      ),
      padding: AppPaddings.commonVerticallPadding,
      decoration: BoxDeco.baseCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPaddings.commonHorizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Holdings',
                  style: GoogleFonts.jost(color: Colors.white, fontSize: 16.sp),
                ),
                Column(
                  children: [
                    Text(
                      '\$1,125',
                      style: GoogleFonts.jost(color: Colors.white, fontSize: 22.sp),
                    ),
                    Text(
                      'Estimated Value',
                      style: GoogleFonts.ibmPlexMono(color: AppColors.whiteColor.withOpacity(0.5), fontSize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.secondaryColor.withOpacity(0.15), height: 1.h,),
          SizedBox(height: 16.h),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HoldingItem(symbol: 'ETH', amount: '0.3', value: '\$672.32', icon: AppImages.eth,),
                  Divider(color: AppColors.secondaryColor.withOpacity(0.15),),
                  const HoldingItem(symbol: 'KNG', amount: '999,400', value: '\$153.20', icon: AppImages.king,),
                  Divider(color: AppColors.secondaryColor.withOpacity(0.15),),
                  const HoldingItem(symbol: 'PEPE', amount: '124,512,484', value: '\$72.32', icon: AppImages.pepe,),
                  Divider(color: AppColors.secondaryColor.withOpacity(0.15),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoldingsSectionHorizontal extends StatelessWidget {
  const HoldingsSectionHorizontal({super.key, this.constraints});
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    return Container(
      constraints:  BoxConstraints(
          minWidth: 300.w,
          maxHeight: constraints!.maxHeight <= 373? 100.h : constraints!.maxHeight * 30/100,
          minHeight: 50.h,
          maxWidth: 480.w
      ),
      // width: width,
      // height: MediaQuery.of(context).size.height * 25/100,
      padding: AppPaddings.commonVerticallPadding,
      decoration: BoxDeco.baseCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
              padding: AppPaddings.commonHorizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: Row(
                      children: [
                        Text(
                          'Holdings',
                          style: GoogleFonts.jost(color: Colors.white, fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              '\$1,125',
                              style: GoogleFonts.jost(color: Colors.white, fontSize: 22.sp),
                            ),
                            Text(
                              'Estimated Value',
                              style: GoogleFonts.ibmPlexMono(color: AppColors.whiteColor.withOpacity(0.5), fontSize: 10.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Divider(color: AppColors.secondaryColor.withOpacity(0.15), height: 1.h,),
          SizedBox(height: 16.h),
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const HoldingItemVertical(symbol: 'ETH', amount: '0.3', value: '\$672.32', icon: AppImages.eth,),
                  VerticalDivider(color: AppColors.secondaryColor.withOpacity(0.15),),
                  const HoldingItemVertical(symbol: 'KNG', amount: '999,400', value: '\$153.20', icon: AppImages.king,),
                  VerticalDivider(color: AppColors.secondaryColor.withOpacity(0.15),),
                  const HoldingItemVertical(symbol: 'PEPE', amount: '124,512,484', value: '\$72.32', icon: AppImages.pepe,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoldingItem extends StatelessWidget {
  final String symbol;
  final String amount;
  final String value;
  final String icon;

  const HoldingItem({super.key, required this.symbol, required this.amount, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(icon, width: 25.w, height: 25.h,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    symbol,
                    style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                value,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HoldingItemVertical extends StatelessWidget {
  final String symbol;
  final String amount;
  final String value;
  final String icon;

  const HoldingItemVertical({super.key, required this.symbol, required this.amount, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 20/100,
        width:  MediaQuery.of(context).size.height * 16/100,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    Image.asset(icon, width: 25.w, height: 25.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        symbol,
                        style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                value,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ActiveTradesSection extends StatelessWidget {
  const ActiveTradesSection({super.key, this.contraints, this.fromSmallView = false});
  final BoxConstraints? contraints;
  final bool? fromSmallView;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      constraints: contraints != null?
      BoxConstraints(
          minWidth: 90.w,
          maxHeight: height <= 150? 100.h : height <= 800? 300.h : 550.h,
          minHeight: 20.h,
          maxWidth: fromSmallView!? 480.h : contraints!.maxWidth
      )
          : BoxConstraints(
          minWidth: 90.w,
          maxHeight: height <= 150? height : height <= 800? height*60/100 : 511.h,
          minHeight: 50.h,
          maxWidth: 280.w
      ),
      padding: AppPaddings.commonVerticallPadding,
      decoration: BoxDeco.baseCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: AppPaddings.commonHorizontalPadding,
            child: Padding(
              padding: AppPaddings.commonVerticallPadding,
              child: Text(
                'Active Trades',
                  style: GoogleFonts.jost(color: AppColors.whiteColor, fontSize: 16.sp, fontWeight: FontWeight.w400)
              ),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ENTRY", style: GoogleFonts.ibmPlexMono(color: AppColors.whiteColor, fontSize: 12.sp, fontWeight: FontWeight.w600)),
                          Text("CURRENT", style: GoogleFonts.ibmPlexMono(color: AppColors.whiteColor, fontSize: 12.sp, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                  const TradeItem(
                    entry: '0.1',
                    entryCurrency: 'PEPE',
                    entryValue: '\$220.17',
                    current: '0.32',
                    currentValue: '\$720.17',
                    multiplier: '3X',
                  ),
                  Divider(color: AppColors.secondaryColor.withOpacity(0.15),),
                  const TradeItem(
                    entry: '0.07',
                    entryCurrency: 'KNG',
                    entryValue: '\$153.20',
                    current: '0.07',
                    currentValue: '\$153.20',
                    multiplier: '0X',
                  ),
                  Divider(color: AppColors.secondaryColor.withOpacity(0.15),),
                  const TradeItem(
                    entry: '0.1',
                    entryCurrency: 'PEPE',
                    entryValue: '\$220.17',
                    current: '0.32',
                    currentValue: '\$720.17',
                    multiplier: '3X',
                  ),
                  Divider(color: AppColors.secondaryColor.withOpacity(0.15),),
                  const TradeItem(
                    entry: '0.07',
                    entryCurrency: 'KNG',
                    entryValue: '\$153.20',
                    current: '0.07',
                    currentValue: '\$153.20',
                    multiplier: '0X',
                  ),
                  Divider(color: AppColors.secondaryColor.withOpacity(0.15),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TradeItem extends StatelessWidget {
  final String entry;
  final String entryCurrency;
  final String entryValue;
  final String current;
  final String currentValue;
  final String multiplier;

  const TradeItem({super.key,
    required this.entry,
    required this.entryCurrency,
    required this.entryValue,
    required this.current,
    required this.currentValue,
    required this.multiplier,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                entryValue,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp,),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                entryCurrency,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, ),
                decoration: BoxDecoration(
                  color: multiplier == '3X' ? AppColors.primaryColor.withOpacity(0.2) : AppColors.secondaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Text(
                  multiplier,
                  style: GoogleFonts.ibmPlexMono(color: multiplier == '3X' ? AppColors.primaryColor : AppColors.whiteColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                current,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                currentValue,
                style: GoogleFonts.ibmPlexMono(color: Colors.white, fontSize: 16.sp,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}