import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/core/navigation/routes.dart';
import 'package:poc/core/theme/dimen.dart';
import 'package:poc/core/theme/extension.dart';
import 'package:poc/data/store/app_data/app_launch_mode.dart';
import 'package:poc/feature/ui/spacer/vertical_spacer.dart';

import '../../../core/di/di.dart';
import '../../../data/store/app_data/app_data_store.dart';
import '../../../data/store/app_data/app_language.dart';

void saveAppLaunchState() async {
  final appDataStore = getIt.get<AppDataStore>();
  await appDataStore.saveAppLaunchMode(mode: AppLaunchMode.login);
}

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnBoardScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<OnboardingItem> get _onboardingItems => [
    OnboardingItem(title: "onboardT1".tr(), description: 'onboardD1'.tr()),
    OnboardingItem(title: 'onboardT2'.tr(), description: 'onboardD2'.tr()),
    OnboardingItem(title: 'onboardT3'.tr(), description: 'onboardD3'.tr()),
  ];

  void _onNext() {
    if (_currentPage < _onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      saveAppLaunchState();
      context.pushReplacement(Routes.login);
    }
  }

  void _onSkip() {
    saveAppLaunchState();
    context.pushReplacement(Routes.login);
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _languageOption('English', 'en'),
              _languageOption('မြန်မာ', 'my'),
            ],
          ),
        );
      },
    );
  }

  Widget _languageOption(String language, String code) {
    return ListTile(
      title: Text("$language ( $code )"),
      onTap: () {
        _changeLanguage(context, Locale(code));
        Navigator.pop(context);
        setState(() {});
      },
    );
  }

  void _changeLanguage(BuildContext context, Locale newLocale) async {
    await context.setLocale(newLocale);
    final appDataStore = getIt.get<AppDataStore>();
    final newLang = AppLanguageExtension.fromAppLanguage(
      newLocale.languageCode,
    );
    await appDataStore.saveAppLanguage(language: newLang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.language, size: 30, color: Colors.black),
            onPressed: _showLanguageDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingItems.length,
              itemBuilder: (context, index) {
                return OnboardingPage(item: _onboardingItems[index]);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingItems.length,
              (index) => buildDot(index, context),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: _onSkip,
                  child: Text(
                    'skip'.tr(),
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                OutlinedButton(
                  onPressed: _onNext,
                  child: Text(
                    _currentPage == _onboardingItems.length - 1
                        ? 'getStarted'.tr()
                        : 'next'.tr(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimens.paddingBase),
      width: _currentPage == index ? 12 : 8,
      height: _currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? context.colors.primary : Colors.grey,
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimens.paddingStandard2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VerticalSpacer(height: Dimens.paddingBase3x),
          Text(
            item.title,
            style: context.textStyles.displaySmall,
            textAlign: TextAlign.center,
          ),
          VerticalSpacer(),
          Text(
            item.description,
            style: context.textStyles.labelLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;

  OnboardingItem({required this.title, required this.description});
}
