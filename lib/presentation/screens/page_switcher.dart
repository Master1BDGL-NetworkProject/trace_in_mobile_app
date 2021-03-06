import 'dart:async';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/assets/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/theme_helper.dart';
import '../../features/ping/presentation/screens/ping_form.dart';
import '../../features/traceroute/presentation/screens/traceroute_form.dart';
import '../riverpod_providers/theme_provider/theme_provider.dart';
import '../widgets/extra_button_widget.dart';
import '../widgets/functions/show_dialog_modal.dart';
import '../widgets/navigation_bar/navigation_bar_item_widget.dart';

class PageSwitcher extends ConsumerStatefulWidget {
  const PageSwitcher({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PageSwitcherState();
  }
}

class _PageSwitcherState extends ConsumerState<PageSwitcher> {
  late final StreamController<int> _screenConroller;
  late final PageController _pageController;
  late int _pageIndex;

  @override
  void initState() {
    super.initState();
    _screenConroller = StreamController.broadcast();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _screenConroller.close();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageIndex = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: _buildAppBar(context, ref),
      bottomNavigationBar: _buildBottomNavigationBar(context, _pageIndex),
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, screenIndex) {
          return _buildViews(screenIndex);
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 0,
      title: Text(
        'TraceIn',
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(letterSpacing: 1.2, fontSize: 15),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      titleSpacing: 25,
      actions: [
        Consumer(
          builder: (__, reff, ___) {
            final _isDark = reff.watch(themeProvider);
            return Switch.adaptive(
                inactiveThumbImage: const AssetImage(AppAssets.lightModeImage),
                activeThumbImage: const AssetImage(AppAssets.darkModeImage),
                value: _isDark,
                activeColor: AppColors.lightOrange,
                onChanged: (_) => ThemeHelper.handleSwitchTheme(_, ref));
          },
        ),
        IconButton(
            onPressed: () => handleAbout(context, ref),
            icon: const ExtraButtonWidget(iconPath: AppAssets.aboutImage))
      ],
    );
  }

  Widget _buildViews(int index) {
    switch (index) {
      case 0:
        return const PingForm();
      case 1:
        return const TracerouteForm();
      default:
        return const PingForm();
    }
  }

  Container _buildBottomNavigationBar(BuildContext context, int pageIndex) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
        height: 55,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(25)),
        child: StreamBuilder<int>(
            stream: _screenConroller.stream,
            initialData: pageIndex,
            builder: (context, screenStatus) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavigationBarItemWidget(
                      onPressed: _handleOnPresedOnNavigationBarItem,
                      currentIndex: screenStatus.data!,
                      ownIndex: 0,
                      icon: const dartz.Right(AppAssets.pingImage),
                      label: 'Ping'),
                  NavigationBarItemWidget(
                      onPressed: _handleOnPresedOnNavigationBarItem,
                      currentIndex: screenStatus.data!,
                      ownIndex: 1,
                      icon: const dartz.Right(AppAssets.tracerouteTinyImage),
                      label: 'Traceroute'),
                ],
              );
            }));
  }

  void _handleOnPresedOnNavigationBarItem(int index) {
    _screenConroller.add(index);
    _switchToScreenOfIndex(index);
  }

  void _switchToScreenOfIndex(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 900),
        curve: Curves.linearToEaseOut);
  }
}
