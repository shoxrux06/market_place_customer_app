import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/core/constants/app_assets.dart';
import 'package:g_customer/src/core/routes/app_router.gr.dart';
import 'package:g_customer/src/presentation/pages/main/shop/order/checkout/riverpod/provider/checkout_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/utils/local_storage.dart';
import '../../../../../core/utils/masked_text_controller.dart';
import '../../../../components/buttons/accent_login_button.dart';
import '../../../../components/components.dart';
import '../../../../theme/app_colors.dart';

class AddCardPage extends ConsumerStatefulWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AddCardPage> createState() => _CardPageState();
}

class _CardPageState extends ConsumerState<AddCardPage> {
  final cardNumberController = MaskedTextController(mask: '0000 0000 0000 0000');
  final cardExpireDateController = MaskedTextController(mask: '00/00');
  late List<Widget> imageSliders;
  List<String> imageCardList = [
    AppAssets.cardBack1,
    AppAssets.cardBack2,
    AppAssets.cardBack3,
    AppAssets.cardBack4,
  ];

  int currentIndex = 0;
  bool isUzcard = false;
  bool isHumo = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checkoutProvider);
    final notifier = ref.watch(checkoutProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();

    imageSliders = imageCardList.map(
          (item) => Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Stack(
            children: [
              SizedBox(
                height: 190,
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              isHumo?Positioned(
                bottom: 20,
                right: 20,
                child: Image.asset(
                  AppAssets.humoLogo,
                  fit: BoxFit.contain,
                  height: 44,
                  width: 60,
                ),
              ): Container(),
              isUzcard?Positioned(
                bottom: 20,
                right: 20,
                child: Image.asset(
                  AppAssets.uzcardLogo,
                  fit: BoxFit.contain,
                  height: 44,
                  width: 60,
                ),
              ): Container(),
              Positioned(
                top: 20,
                left: 20,
                child:Row(
                  children: [
                    Text(
                      'LOGO',
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w900,
                        fontSize: 16.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      'BANK NAME',
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      cardNumberController.text,
                      style: GoogleFonts.k2d(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.cardHolder),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: isDarkMode ? AppColors.white : AppColors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '',
                                style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: isDarkMode ? AppColors.white : AppColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.expiryDate),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: isDarkMode ? AppColors.white : AppColors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                cardExpireDateController.text,
                                style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp,
                                  color: isDarkMode ? AppColors.white : AppColors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppHelpers.getTranslation(TrKeys.addCard), style: GoogleFonts.k2d(
          fontWeight: FontWeight.w500,
          fontSize: 18.sp,
          color: isDarkMode
              ? AppColors.white.withOpacity(0.5)
              : AppColors.black,
        ),),
        centerTitle: true,
        backgroundColor: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        leading: IconButton(
          onPressed: context.popRoute,
          icon: Icon(
            FlutterRemix.arrow_left_s_line,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
          splashRadius: 20.r,
          padding: EdgeInsets.zero,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.verticalSpace,
              SizedBox(
                height: 190,
                child: CarouselSlider(
                  items: imageSliders,
                  options: CarouselOptions(
                    aspectRatio: 1.9,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    initialPage: currentIndex,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              20.verticalSpace,
              input(cardNumberController, '0000 0000 0000 0000', cardNumberController.text, true),
              10.verticalSpace,
              input(cardExpireDateController, AppHelpers.getTranslation(TrKeys.dateYearOfExpiration), cardExpireDateController.text, false),
              10.verticalSpace,
              // input(cardNameController, 'Дайте название карты', cardNameController.text, false),
              20.verticalSpace,
              AccentLoginButton(
                title: AppHelpers.getTranslation(TrKeys.enterData),
                isLoading: state.isCardBinding,
                onPressed: () {
                  String newCarNumber = cardNumberController.text.replaceAll(' ', '').trim();
                  String newExpDate = cardExpireDateController.text.replaceAll('/', '').trim();
                  notifier.bindCard(
                    context,
                    newCarNumber,
                    newExpDate,
                  ).then((value) {
                    context.router.push(const CardConfirmationRoute());
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget input(TextEditingController controller, String label, String inputText, bool isCardNumberField) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();

    return Container(
      height: 48,
      child:  TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        style: GoogleFonts.k2d(
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          color: isDarkMode ? AppColors.white : AppColors.black,
        ),
        controller: controller,
        cursorColor: isDarkMode ? AppColors.white : AppColors.black,
        cursorWidth: 1,
        onChanged: (val){
          print('value ->> $val');
          setState(() {
            inputText = val;
            print('inputText -->${inputText.substring(0,3)}');
            if(isCardNumberField){
              if(inputText.length > 4){
                if(inputText.substring(0,4) == '8600'){
                  isUzcard = true;
                }else if(inputText.substring(0,4) == '9860'){
                  isHumo = true;
                }
              }else if(inputText.length < 4){
                isUzcard = false;
                isHumo = false;
              }
            }
          });
        },
        decoration: InputDecoration(
          labelText: label,
          hintStyle: GoogleFonts.k2d(
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: isDarkMode
                ? AppColors.white.withOpacity(0.5)
                : AppColors.hintColor,
          ),
          labelStyle: GoogleFonts.k2d(
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: isDarkMode
                ? AppColors.white.withOpacity(0.5)
                : AppColors.hintColor,
          ),
          contentPadding: REdgeInsets.symmetric(horizontal: 15, vertical: 12),
          fillColor: isDarkMode ? AppColors.mainBackDark : AppColors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode ? AppColors.mainBackDark : AppColors.searchTextFormFieldColor,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: isDarkMode ? AppColors.mainBackDark : AppColors.searchTextFormFieldColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:isDarkMode ? AppColors.mainBackDark : AppColors.searchTextFormFieldColor,
            ),
          ),
        ),
      ),
    );
  }
}
