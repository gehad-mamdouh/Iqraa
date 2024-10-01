import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami/bottom_sheets/language_bottom_sheet.dart';
import 'package:islami/bottom_sheets/theme_bottom_sheet.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'theme'.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ThemeBottomSheets();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Color(0xffB7935F)),
              ),
              child: Text(
                pro.appTheme == ThemeMode.light ? 'light'.tr() : 'dark'.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'language'.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return LanguageBottomSheet();
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Color(0xffB7935F)),
              ),
              child: Text(
                pro.langCode == 'ar' ? 'arabic'.tr() : 'english'.tr(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}