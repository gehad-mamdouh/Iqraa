import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              pro.changeLanguage("en");
              context.setLocale(Locale('en'));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'english'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: pro.langCode == 'en'
                          ? Color(0xffB7935F)
                          : Colors.black),
                ),
                if (pro.langCode == 'en')
                  Icon(Icons.done, size: 35, color: Color(0xffB7935F)),
              ],
            ),
          ),
          SizedBox(height: 24),
          InkWell(
            onTap: () {
              pro.changeLanguage("ar");
              context.setLocale(Locale('ar'));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'arabic'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: pro.langCode == 'ar'
                          ? Color(0xffB7935F)
                          : Colors.black),
                ),
                if (pro.langCode == 'ar')
                  Icon(Icons.done, size: 35, color: Color(0xffB7935F)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
