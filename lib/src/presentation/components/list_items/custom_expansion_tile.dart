import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../../models/models.dart';
import '../../theme/theme.dart';
import '../shimmers/make_shimmer.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({
    Key? key,
    required this.orderDetails,
    required this.child,
    this.onExpansionChanged,
    this.initiallyExpanded = false,
  }) : super(key: key);

  final ShopOrderDetails orderDetails;

  final ValueChanged<bool>? onExpansionChanged;

  final Widget child;

  final bool initiallyExpanded;

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {});
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    widget.onExpansionChanged?.call(_isExpanded);
  }

  Widget? _buildIcon(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return RotationTransition(
      turns: _iconTurns,
      child: Icon(
        FlutterRemix.arrow_drop_down_line,
        color: isDarkMode ? AppColors.white : AppColors.black,
        size: 24.r,
      ),
    );
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          children: [
            Material(
              color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
              child: InkWell(
                onTap: _handleTap,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 60.r,
                      padding: EdgeInsetsDirectional.only(start: 15.r),
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(35.r),
                                      child: CachedNetworkImage(
                                        width: 40.r,
                                        height: 40.r,
                                        imageUrl:
                                            '${AppConstants.imageBaseUrl}/${widget.orderDetails.shop?.logoImg}',
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, progress) {
                                          return MakeShimmer(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                color: AppColors.mainBack,
                                              ),
                                            ),
                                          );
                                        },
                                        errorWidget: (context, url, error) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: AppColors.mainBack,
                                            ),
                                            alignment: Alignment.center,
                                            child: Icon(
                                              FlutterRemix.image_line,
                                              color: AppColors.black
                                                  .withOpacity(0.5),
                                              size: 18.r,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    12.horizontalSpace,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.orderDetails.shop?.translation?.title}',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.k2d(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                            letterSpacing: -1,
                                            color: isDarkMode
                                                ? AppColors.white
                                                : AppColors.black,
                                          ),
                                        ),
                                        Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.store),
                                          style: GoogleFonts.k2d(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            letterSpacing: -1,
                                            color: AppColors.hintColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                if (!_isExpanded)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${widget.orderDetails.orderStocks?.length}',
                                        style: GoogleFonts.k2d(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          letterSpacing: -1,
                                          color: isDarkMode
                                              ? AppColors.white
                                              : AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        AppHelpers.getTranslation(
                                            TrKeys.products),
                                        style: GoogleFonts.k2d(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          letterSpacing: -1,
                                          color: AppColors.hintColor,
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          IconButton(
                            splashRadius: 18.r,
                            onPressed: _handleTap,
                            icon: SizedBox(child: _buildIcon(context)),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1.r,
                      thickness: 1.r,
                      color: isDarkMode
                          ? AppColors.borderDark
                          : AppColors.mainBack,
                    ),
                    Container(
                      height: 45.r,
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30.r,
                                height: 30.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color:
                                      widget.orderDetails.status != 'delivered'
                                          ? AppColors.black
                                          : AppColors.accentGreen,
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  AppHelpers.getOrderStatusIcon(
                                      widget.orderDetails.status),
                                  size: 16.r,
                                  color: AppColors.white,
                                ),
                              ),
                              17.horizontalSpace,
                              Text(
                                AppHelpers.getOrderStatusText(
                                  widget.orderDetails.status,
                                ),
                                style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  letterSpacing: -1,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 200.r,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: LinearProgressIndicator(
                                value: AppHelpers.getOrderStatusProgress(
                                  widget.orderDetails.status,
                                ),
                                color: AppColors.accentGreen,
                                backgroundColor:
                                    AppColors.orderStatusProgressBack,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            1.verticalSpace,
          ],
        ),
        ClipRect(
          child: Align(
            alignment: expansionTileTheme.expandedAlignment ?? Alignment.center,
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
        10.verticalSpace,
      ],
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    final ExpansionTileThemeData expansionTileTheme =
        ExpansionTileTheme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    _borderColorTween.end = theme.dividerColor;
    _headerColorTween
      ..begin = expansionTileTheme.collapsedTextColor ??
          theme.textTheme.subtitle1!.color
      ..end = expansionTileTheme.textColor ?? colorScheme.primary;
    _iconColorTween
      ..begin =
          expansionTileTheme.collapsedIconColor ?? theme.unselectedWidgetColor
      ..end = expansionTileTheme.iconColor ?? colorScheme.primary;
    _backgroundColorTween.end = expansionTileTheme.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    final Widget result = Offstage(
      offstage: closed,
      child: TickerMode(
        enabled: !closed,
        child: widget.child,
      ),
    );
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: result,
    );
  }
}
