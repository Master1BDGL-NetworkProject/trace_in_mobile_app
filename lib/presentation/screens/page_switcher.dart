import 'dart:async';

import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trace_in_mobile_app/features/traceroute/presentation/screens/traceroute_form.dart';

import '../../core/assets/app_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../features/ping/presentation/screens/ping_form.dart';
import '../riverpod_providers/theme_provider/theme_provider.dart';
import '../widgets/extra_button_widget.dart';
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

  @override
  void initState() {
    super.initState();
    _screenConroller = StreamController.broadcast();
  }

  @override
  void dispose() {
    _screenConroller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, ref),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      body: StreamBuilder<int>(
          stream: _screenConroller.stream,
          initialData: 0,
          builder: (context, screenStatus) {
            return _buildViews(screenStatus.data!);
          }),
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
                onChanged: (_) => _handleSwitchTheme(_, ref));
          },
        ),
        IconButton(
            onPressed: _handleAbout,
            icon: const ExtraButtonWidget(iconPath: AppAssets.aboutImage))
      ],
    );
  }

  void _handleAbout() {
    //TODO
  }

  void _handleSwitchTheme(bool currentValue, WidgetRef ref) {
    if (currentValue) {
      ref.read(themeProvider.notifier).switchDarkTheme();
    } else {
      ref.read(themeProvider.notifier).switchLightTheme();
    }
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

  Container _buildBottomNavigationBar(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
        height: 55,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(25)),
        child: StreamBuilder<int>(
            stream: _screenConroller.stream,
            initialData: 0,
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
  }
}
