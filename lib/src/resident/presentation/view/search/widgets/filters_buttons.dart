import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vista_market/src/common/animations/animate_do.dart';
import 'package:vista_market/src/common/base/extensions.dart';
import 'package:vista_market/src/common/base/filter_button_enum.dart';
import 'package:vista_market/src/common/widgets/custom_text_field.dart';
import 'package:vista_market/src/resident/presentation/view/search/widgets/save_filter_button.dart';
import 'package:vista_market/src/resident/presentation/view/search/widgets/search_for_data_icon.dart';
import 'package:vista_market/src/resident/presentation/view/search/widgets/search_name_price_button.dart';

class FiltersButtons extends StatefulWidget {
  const FiltersButtons({super.key});

  @override
  State<FiltersButtons> createState() => _FiltersButtonsState();
}

class _FiltersButtonsState extends State<FiltersButtons> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  FilterButtonEnum searchEnum = FilterButtonEnum.none;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: context.tr.search_name,
                  isSelected: searchEnum == FilterButtonEnum.name,
                  onTap: () async {
                    nameSearchTap();
                  },
                ),
              ),
              CustomFadeInRight(
                duration: 200,
                child: SearchNamePriceButton(
                  title: context.tr.search_price,
                  isSelected: searchEnum == FilterButtonEnum.price,
                  onTap: () async {
                    priceSearchTap();
                  },
                ),
              ),
            ],
          ),
          15.verticalSpace,
          if (searchEnum == FilterButtonEnum.name) ...[
            CustomFadeInDown(
              duration: 200,
              child: CustomTextField(
                controller: controller,
                hintText: context.tr.search_hint,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return context.tr.search_validate;
                  }
                  return null;
                },
              ),
            ),
            SaveFilterButton(onPressed: () {}),
          ] else if (searchEnum == FilterButtonEnum.price) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.h,
                    child: CustomTextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      hintText: context.tr.price_hint,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return context.tr.price_validate;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                CustomFadeInDown(
                  duration: 200,
                  child: SizedBox(
                    width: 160.h,
                    child: CustomTextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      hintText: context.tr.price_hint_max,
                      validator: (p0) {
                        if (p0 == null || p0.isEmpty) {
                          return context.tr.price_validate_max;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SaveFilterButton(onPressed: () {}),
          ],
          if(searchEnum == FilterButtonEnum.none)...[
             SizedBox(
              height: 100.h,
            ),
            const SearchForDataIcon(),
          ],
        ],
      ),
    );
  }

  void priceSearchTap() {
    if (searchEnum == FilterButtonEnum.price) {
      setState(() {
        searchEnum = FilterButtonEnum.none;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonEnum.price;
      });
    }
  }

  void nameSearchTap() {
    if (searchEnum == FilterButtonEnum.name) {
      setState(() {
        searchEnum = FilterButtonEnum.none;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonEnum.name;
      });
    }
  }
}
