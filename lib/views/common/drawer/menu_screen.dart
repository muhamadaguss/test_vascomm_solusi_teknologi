import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:line_icons/line_icons.dart';
import 'package:test_vascomm/routes/app_pages.dart';
import 'package:test_vascomm/views/common/app_style.dart';

import '../../../constants/app_constants.dart';
import '../../../cubit/main/main_cubit.dart';
import '../../../injection_container.dart';
import '../height_spacer.dart';
import '../width_spacer.dart';
import 'menu_item.dart';

class MenuItems {
  static const homepage = MenuItem('Homepage', LineIcons.home);
  static const myProfile = MenuItem('My Profile', LineIcons.user);

  static const all = <MenuItem>[
    homepage,
    myProfile,
  ];
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpacer(height: 60),
          userInfo(),
          const HeightSpacer(height: 55),
          ...MenuItems.all
              .map(
                (e) => menuIcon(
                  e,
                ),
              )
              .toList(),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              width: double.infinity,
              height: 35.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23.r),
                  ),
                ),
                onPressed: () {
                  sl<MainCubit>().logOut();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.LOGIN,
                    (route) => false,
                  );
                },
                child: Text(
                  'Logout',
                  style: titlestyle(
                    14,
                    Color(kLight.value),
                    FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          const HeightSpacer(height: 40),
        ],
      ),
    );
  }

  Widget menuIcon(
    MenuItem menuItem,
  ) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: MenuItems.all.indexOf(menuItem) == MenuItems.all.length - 1
            ? 0
            : 15.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: const Color(0xFFF4F5F6),
      ),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return ListTile(
            selected: state.item == MenuItems.all.indexOf(menuItem),
            selectedTileColor: Color(kDark.value).withOpacity(.1),
            selectedColor: Color(kLightGrey.value),
            onTap: () {
              sl<MainCubit>().changeItem(MenuItems.all.indexOf(menuItem));
              ZoomDrawer.of(context)!.close();
            },
            leading: menuItem.icon == null
                ? null
                : Icon(
                    menuItem.icon,
                    color: Color(
                      kGrey.value,
                    ),
                  ),
            title: Text(
              menuItem.title,
              style: titlestyle(
                16,
                Color(kGrey.value),
                FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget userInfo() {
    return Container(
      width: 189.w,
      padding: EdgeInsets.only(
        left: 20.w,
        top: 40.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/avatar.png',
            height: 40.h,
            width: 40.w,
          ),
          const WidthSpacer(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Angga Praja',
                  style: titlestyle(
                    16,
                    Color(kDarkBlue.value),
                    FontWeight.bold,
                  ),
                ),
                Text(
                  'Membership BBLK',
                  style: subtitlestyle(
                    12,
                    Color(kGrey.value),
                    FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
