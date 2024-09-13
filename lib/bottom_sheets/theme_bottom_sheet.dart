import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheets extends StatelessWidget {
  const ThemeBottomSheets({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
        decoration: BoxDecoration(
            color: provider.appTheme == ThemeMode.dark
                ? Color(0xff141A2E)
                : Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            )),
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'light'.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        color: provider.appTheme == ThemeMode.dark
                            ? Colors.white
                            : Color(0xffB7935F)),
                  ),
                  provider.appTheme == ThemeMode.dark ? SizedBox()
                  : Icon(Icons.done,
                    color: Color(0xffB7935F),
                    size: 35,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'dark'.tr(),
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                        color: provider.appTheme == ThemeMode.dark
                            ? Colors.yellow
                            : Colors.black),
                  ),
                  provider.appTheme == ThemeMode.light ? SizedBox()
                      : Icon(Icons.done,
                    color:Colors.yellow,
                    size: 35,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
