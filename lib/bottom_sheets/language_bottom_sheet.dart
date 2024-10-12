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
        color: pro.appTheme == ThemeMode.dark
            ? const Color(0xff141A2E)
            : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              pro.changeLanguage("en");
              context.setLocale(const Locale('en'));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'english'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: pro.langCode == 'en'
                            ? (pro.appTheme == ThemeMode.dark
                                ? const Color(0xFFFACC1D)
                                : const Color(0xffB7935F))
                            : (pro.appTheme == ThemeMode.dark
                                ? Colors.white
                                : Colors.black),
                      ),
                ),
                if (pro.langCode == 'en')
                  Icon(Icons.done,
                      size: 35,
                      color: pro.appTheme == ThemeMode.dark
                          ? const Color(0xFFFACC1D)
                          : const Color(0xffB7935F)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              pro.changeLanguage("ar");
              context.setLocale(const Locale('ar'));
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'arabic'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: pro.langCode == 'ar'
                            ? (pro.appTheme == ThemeMode.dark
                                ? const Color(0xFFFACC1D)
                                : const Color(0xffB7935F))
                            : (pro.appTheme == ThemeMode.dark
                                ? Colors.white
                                : Colors.black),
                      ),
                ),
                if (pro.langCode == 'ar')
                  Icon(Icons.done,
                      size: 35,
                      color: pro.appTheme == ThemeMode.dark
                          ? const Color(0xFFFACC1D)
                          : const Color(0xffB7935F)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
