import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'category_sub_item.dart';
import 'category_tab_body.dart';

class CategoryItem extends StatefulWidget {
  final List<CategoryData> categories;

  const CategoryItem({Key? key, required this.categories}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.categories.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    bool isExpanded = false;
    return ListView(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: widget.categories
          .map(
            (category) => ExpansionTile(
              leading:CommonImage(imageUrl: category.img,width: 32,height: 32,),
              title: Text(
                '${category.translation?.title}',
              ),
              onExpansionChanged: (expanded){
                setState(() {
                  isExpanded = expanded;
                });
              },
              trailing: Icon(isExpanded? Icons.keyboard_arrow_down_rounded:Icons.keyboard_arrow_up_rounded,size: 48,),
              children: widget.categories.map((cat) => CategorySubItem(categories: cat.children??[],)).toList()
            ),
          )
          .toList(),
    );
  }
}
