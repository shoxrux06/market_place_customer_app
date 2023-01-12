import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../theme/theme.dart';

class ShopOrderStatus extends StatelessWidget {
  final String status;

  const ShopOrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: 64.r,
      padding: REdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppHelpers.getOrderStatus(status) == OrderStatus.newOrder
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    LinearProgressIndicator(
                      value: 0,
                      color: AppColors.accentGreen,
                      backgroundColor: AppColors.dontHaveAccBtnBack,
                      minHeight: 3.r,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 13.r,
                          height: 13.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: AppColors.white,
                            border: Border.all(
                              color: AppColors.accentGreen,
                              width: 4.r,
                            ),
                          ),
                        ),
                        Container(
                          width: 13.r,
                          height: 13.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: AppColors.unselectedOrderStatus,
                          ),
                        ),
                        Container(
                          width: 13.r,
                          height: 13.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: AppColors.unselectedOrderStatus,
                          ),
                        ),
                        Container(
                          width: 13.r,
                          height: 13.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: AppColors.unselectedOrderStatus,
                          ),
                        ),
                        Container(
                          width: 13.r,
                          height: 13.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.r),
                            color: AppColors.unselectedOrderStatus,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : AppHelpers.getOrderStatus(status) == OrderStatus.accepted
                  ? Stack(
                      alignment: Alignment.center,
                      children: [
                        LinearProgressIndicator(
                          value: 1 / 4,
                          color: AppColors.accentGreen,
                          backgroundColor: AppColors.dontHaveAccBtnBack,
                          minHeight: 3.r,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 13.r,
                              height: 13.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: AppColors.accentGreen,
                              ),
                            ),
                            Container(
                              width: 13.r,
                              height: 13.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: AppColors.white,
                                border: Border.all(
                                  color: AppColors.accentGreen,
                                  width: 4.r,
                                ),
                              ),
                            ),
                            Container(
                              width: 13.r,
                              height: 13.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: AppColors.unselectedOrderStatus,
                              ),
                            ),
                            Container(
                              width: 13.r,
                              height: 13.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: AppColors.unselectedOrderStatus,
                              ),
                            ),
                            Container(
                              width: 13.r,
                              height: 13.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.r),
                                color: AppColors.unselectedOrderStatus,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : AppHelpers.getOrderStatus(status) == OrderStatus.ready
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            LinearProgressIndicator(
                              value: 2 / 4,
                              color: AppColors.accentGreen,
                              backgroundColor: AppColors.dontHaveAccBtnBack,
                              minHeight: 3.r,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 13.r,
                                  height: 13.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: AppColors.accentGreen,
                                  ),
                                ),
                                Container(
                                  width: 13.r,
                                  height: 13.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: AppColors.accentGreen,
                                  ),
                                ),
                                Container(
                                  width: 13.r,
                                  height: 13.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: AppColors.white,
                                    border: Border.all(
                                      color: AppColors.accentGreen,
                                      width: 4.r,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 13.r,
                                  height: 13.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: AppColors.unselectedOrderStatus,
                                  ),
                                ),
                                Container(
                                  width: 13.r,
                                  height: 13.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.r),
                                    color: AppColors.unselectedOrderStatus,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : AppHelpers.getOrderStatus(status) == OrderStatus.onAWay
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                LinearProgressIndicator(
                                  value: 3 / 4,
                                  color: AppColors.accentGreen,
                                  backgroundColor: AppColors.dontHaveAccBtnBack,
                                  minHeight: 3.r,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.accentGreen,
                                      ),
                                    ),
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.accentGreen,
                                      ),
                                    ),
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.accentGreen,
                                      ),
                                    ),
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.accentGreen,
                                          width: 4.r,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.unselectedOrderStatus,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                LinearProgressIndicator(
                                  value: 4 / 4,
                                  color: AppColors.accentGreen,
                                  backgroundColor: AppColors.dontHaveAccBtnBack,
                                  minHeight: 3.r,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.accentGreen,
                                      ),
                                    ),
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.accentGreen,
                                      ),
                                    ),
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.accentGreen,
                                      ),
                                    ),
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.accentGreen,
                                      ),
                                    ),
                                    Container(
                                      width: 13.r,
                                      height: 13.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(7.r),
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.accentGreen,
                                          width: 4.r,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
          5.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppHelpers.getTranslation(TrKeys.newKey),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  letterSpacing: -1,
                  color: AppColors.black,
                ),
              ),
              Text(
                AppHelpers.getTranslation(TrKeys.accepted),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  letterSpacing: -1,
                  color: AppColors.black,
                ),
              ),
              Text(
                AppHelpers.getTranslation(TrKeys.ready),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  letterSpacing: -1,
                  color: AppColors.black,
                ),
              ),
              Text(
                AppHelpers.getTranslation(TrKeys.onAWay),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  letterSpacing: -1,
                  color: AppColors.black,
                ),
              ),
              Text(
                AppHelpers.getTranslation(TrKeys.delivered),
                style: GoogleFonts.k2d(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  letterSpacing: -1,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
