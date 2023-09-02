import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:test_vascomm/cubit/main/main_cubit.dart';
import 'package:test_vascomm/views/ui/home_view.dart';
import 'package:test_vascomm/views/ui/profile_view.dart';

import '../../../main.dart';
import 'menu_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return ZoomDrawer(
          controller: z,
          menuScreen: const MenuScreen(),
          mainScreen: state.item == null || state.item == 0
              ? const HomeView()
              : const ProfileView(),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0,
          menuBackgroundColor: Colors.grey[200]!,
          drawerShadowsBackgroundColor: Colors.grey,
          slideWidth: 293.w,
          openCurve: Curves.fastOutSlowIn,
        );
      },
    );
  }
}
