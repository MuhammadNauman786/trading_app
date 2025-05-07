

import 'package:skill_assessment/app_library.dart';

class GenerateTokenCard extends StatefulWidget {
  const GenerateTokenCard({super.key, this.constraints, this.king});
  final BoxConstraints? constraints;
  final String? king;

  @override
  State<GenerateTokenCard> createState() => _GenerateTokenCardState();
}

class _GenerateTokenCardState extends State<GenerateTokenCard> {
  double payAmount = 2.35;
  String selectedCurrency = 'ETH';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // debugPrint("Screen Height = $height");
    // debugPrint("Screen width = $width");
    return Container(
      constraints:  BoxConstraints(
          minWidth: 300.w,
          maxHeight: widget.constraints != null? 450 : height <= 150? height : height <= 800? height*60/100 : 511.h,
          minHeight: 50.h,
          maxWidth: widget.constraints != null? widget.constraints!.maxWidth*60/100 : 480.w
      ),
      // width: 511.w,
      // height: MediaQuery.of(context).size.height*70/100,
      decoration: BoxDeco.baseCardDecoration,
      child: Padding(
        padding: EdgeInsets.all(18.w),
        child: Column(
          children: [
            titleWidget,
            SizedBox(
              height: 8.h,
            ),
            genTokenCard
          ],
        ),
      ),
    );
  }

  Widget get titleWidget => Flexible(
    flex: 1,
    fit: FlexFit.tight,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        FittedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSvgImage(assetName: AppSvgs.logo, width: 26.w, height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  "KingSwap",
                  style: GoogleFonts.jost(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16.sp
                  ),
                ),
              ),
            ],
          ),
        ),
        Offstage(
          offstage: widget.king == null,
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.scaffoldColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50.r)
              ),
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Row(
                  children: [
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(
                              text: "MevSafe ",
                              style: GoogleFonts.ibmPlexMono(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp
                              )
                          ),

                          TextSpan(
                              text: "50% Slippage",
                              style: GoogleFonts.ibmPlexMono(
                                  color: AppColors.secondaryColor,
                                  fontSize: 12.sp
                              )
                          ),
                        ]
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: AppSvgImage(assetName: AppSvgs.setting, width: 15.w, height: 16.h,),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );

  Widget get genTokenCard => Flexible(
    flex: 12,
    fit: FlexFit.tight,
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor,
        borderRadius: BorderRadius.circular(2.r)
      ),
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(flex: 4,child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.cardAnchorColor.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          child: _buildPaySection(),
                        ),
                      )),
                      Expanded(flex: 4,child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.cardAnchorColor.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                          child: _buildReceiveSection(),
                        ),
                      )),
                    ],
                  ),
                  Positioned.fill(child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Container(
                          width: 50.w,
                          height: 50.h,
                          decoration: const BoxDecoration(
                              color: AppColors.scaffoldColor,
                              shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: FittedBox(
                              child: AppSvgImage(
                                assetName: widget.king ?? AppSvgs.pep,
                                width: 36.w,
                                height: 36.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
          Expanded(flex: 2,child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.h),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: widget.king != null? 
                      OutlinedButton(onPressed: (){},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.r)
                              ),
                            side: BorderSide(
                                color: AppColors.secondaryColor.withOpacity(0.15)
                            ),
                            
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text(
                                'SELECT A TOKEN',
                                style: GoogleFonts.ibmPlexMono(
                                    fontSize: 16.sp,
                                    color: AppColors.whiteColor.withOpacity(0.2)
                                ),
                              ),
                            ),
                          )
                      )
                      : ElevatedButton(
                    onPressed: (){
                      showDialog(context: context, builder: (context) => Dialog(
                        backgroundColor: Colors.transparent,
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 300.w,
                            maxWidth: 990.w,
                            maxHeight: 283.h,
                            minHeight: 283.h
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.dialogBoxColor,
                            borderRadius: BorderRadius.circular(2.r),
                            border: Border.all(
                              color: AppColors.secondaryColor.withOpacity(0.1)
                            )
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(18.w),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: AppPaddings.commonVerticallPadding,
                                    child: Text(
                                      'ENTER YOUR PRIVATE KEY',
                                      style: GoogleFonts.ibmPlexMono(
                                          fontSize: 16.sp,
                                        fontWeight: FontWeight.w300
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: AppPaddings.commonHorizontalPadding,
                                    child: TextField(
                                      style: GoogleFonts.ibmPlexMono(
                                        fontSize: 16.sp,
                                        color: AppColors.primaryColor,
                                      ),
                                      decoration: InputDecoration(
                                        fillColor: AppColors.scaffoldColor,
                                        hintText: "RANDOM3348347i2301238123",
                                        hintStyle: GoogleFonts.ibmPlexMono(
                                          fontSize: 16.sp,
                                          color: AppColors.whiteColor.withOpacity(0.5),
                                      ),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: AppPaddings.commonVerticallPadding,
                                    child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const DashboardView()));
                                      },
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: AppColors.whiteColor.withOpacity(0.08),
                                        side: BorderSide(
                                            color: AppColors.whiteColor.withOpacity(0.1)
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(2.r),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.w),
                                        child: Text(
                                          'CONTINUE',
                                          style: GoogleFonts.ibmPlexMono(
                                              fontSize: 14.sp,
                                            color: AppColors.whiteColor
                                          ),
                                        ),
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      overlayColor: AppColors.scaffoldColor,
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.r)
                      )
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            'GENERATE PRIVATE KEY',
                            style: GoogleFonts.ibmPlexMono(
                                fontSize: 16.sp,
                                color: AppColors.scaffoldColor
                            ),
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(flex: 1,child: Container(),)
        ],
      ),
    ),
  );

  Widget _buildPaySection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                FittedBox(
                  child: Text(
                    'You pay',
                    style: GoogleFonts.ibmPlexMono(
                        fontSize: 12.sp,
                        color: AppColors.whiteColor.withOpacity(0.5)
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text(
                    payAmount.toString(),
                    style: GoogleFonts.ibmPlexMono(
                      fontSize: 28.sp
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      child: Container(
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: AppColors.scaffoldColor,
                          borderRadius: BorderRadius.circular(2.r)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: DropdownButton<String>(
                            value: selectedCurrency,
                            dropdownColor: AppColors.scaffoldColor,
                            style: GoogleFonts.ibmPlexMono(
                                fontSize: 16.sp,
                                color: AppColors.whiteColor
                            ),
                            icon: const AppSvgImage(assetName: AppSvgs.downArrow,),
                            underline: Container(),
                            items: <String>['ETH', 'BTC', 'USD'].map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(value == 'ETH'? AppImages.eth : value == 'BTC'? AppImages.btc : AppImages.busd, width: 21.w, height: 21.h,),
                                    SizedBox(width: 8.w,),
                                    Text(value),
                                    SizedBox(width: 16.w,),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCurrency = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiveSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    'You receive',
                    style: GoogleFonts.ibmPlexMono(
                        fontSize: 12.sp,
                        color: AppColors.whiteColor.withOpacity(0.5)
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  fit: BoxFit.fill,
                  child: Text(
                    '0',
                    style: GoogleFonts.ibmPlexMono(
                        fontSize: 30.sp,
                        color: AppColors.whiteColor.withOpacity(0.5)
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: AppColors.primaryColor
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'SELECT',
                          style: GoogleFonts.ibmPlexMono(
                              fontSize: 16.sp,
                              color: AppColors.primaryColor
                          ),
                        ),
                        const AppSvgImage(assetName: AppSvgs.downArrow, color: AppColors.primaryColor,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

