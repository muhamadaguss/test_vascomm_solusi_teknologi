import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

import '../../constants/app_constants.dart';
import '../common/app_style.dart';
import '../common/drawer/drawer_widget.dart';
import '../common/height_spacer.dart';
import '../common/width_spacer.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const DrawerWidget(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  LineIcons.shoppingCart,
                  size: 25.w,
                  color: Colors.black,
                ),
                const WidthSpacer(width: 10),
                Icon(
                  LineIcons.bell,
                  size: 25.w,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const HeightSpacer(height: 30),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                height: 30.h,
                decoration: BoxDecoration(
                  color: Color(kLight.value),
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(kDarkBlue.value).withOpacity(.15),
                      blurRadius: 20.0,
                      offset: const Offset(0.0, 10),
                    )
                  ],
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20.r,
                    ),
                    color: Color(kLightBlue.value),
                  ),
                  labelColor: Color(kDarkBlue.value),
                  unselectedLabelColor: Color(kDarkBlue.value),
                  labelStyle: subtitlestyle(
                    14,
                    Color(kDarkBlue.value),
                    FontWeight.w600,
                  ),
                  unselectedLabelStyle: subtitlestyle(
                    14,
                    Color(kDarkBlue.value),
                    FontWeight.w400,
                  ),
                  tabs: const [
                    Tab(text: "Profile Saya"),
                    Tab(text: "Pengaturan"),
                  ],
                ),
              ),
              const HeightSpacer(height: 30),
              SizedBox(
                height: 1000.h,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    profile(),
                    const Center(
                      child: Text(
                        'Pengaturan',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profile() {
    return Column(
      children: [
        const HeightSpacer(height: 40),
        Container(
          height: 956.h,
          width: 311.w,
          decoration: BoxDecoration(
            color: Color(kLight.value),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: Color(kDarkBlue.value).withOpacity(.5),
                blurRadius: 20.0,
                offset: const Offset(0.0, 10),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cardUser(),
              const HeightSpacer(height: 15),
              Center(
                child: Text(
                  'Pilih data yang ingin ditampilkan',
                  style: titlestyle(
                    16,
                    Color(kDarkBlue.value),
                    FontWeight.w600,
                  ),
                ),
              ),
              const HeightSpacer(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(kLightBlue.value),
                    ),
                    child: Center(
                      child: Icon(
                        LineIcons.userEdit,
                        color: Color(kDarkBlue.value),
                      ),
                    ),
                  ),
                  const WidthSpacer(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data Diri',
                        style: titlestyle(
                          14,
                          Color(kDarkBlue.value),
                          FontWeight.w600,
                        ),
                      ),
                      const HeightSpacer(height: 5),
                      Text(
                        'Data diri anda sesuai KTP',
                        style: subtitlestyle(
                          10,
                          Color(kLightGrey.value),
                          FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const WidthSpacer(width: 10),
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFEBEDF7),
                    ),
                    child: Center(
                      child: Icon(
                        LineIcons.mapMarker,
                        color: Color(kDarkBlue.value),
                      ),
                    ),
                  ),
                ],
              ),
              const HeightSpacer(height: 40),
              textfield(
                'Nama Depan',
                'Masukkan Nama Depan anda',
                value: 'Jhon',
              ),
              textfield(
                'Nama Belakang',
                'Masukkan Nama Belakang anda',
                value: 'Doe',
              ),
              textfield(
                'Email',
                'Masukkan email anda',
              ),
              textfield(
                'No. Telepon',
                'Masukkan no telepon anda',
              ),
              textfield(
                'No. KTP',
                'Masukkan no KTP anda',
              ),
              const HeightSpacer(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info,
                    color: Color(kDarkBlue.value),
                  ),
                  const WidthSpacer(width: 10),
                  SizedBox(
                    width: 223.w,
                    child: Text(
                      'Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya',
                      style: subtitlestyle(
                        12,
                        Color(kLightGrey.value),
                        FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
              const HeightSpacer(height: 20),
              Center(
                child: SizedBox(
                  width: 251.w,
                  height: 36.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(kDarkBlue.value),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'Simpan Profile',
                          style: titlestyle(
                            14,
                            Color(kLight.value),
                            FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Icon(
                            Icons.save,
                            color: Color(kLight.value),
                            size: 16.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget textfield(String title, String hint, {String? value}) {
    return Padding(
      padding: EdgeInsets.only(
        left: 30.w,
        right: 30.w,
        bottom: 30.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titlestyle(
              16,
              Color(kDarkBlue.value),
              FontWeight.w600,
            ),
          ),
          const HeightSpacer(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.15),
                ),
              ],
            ),
            child: TextFormField(
              cursorColor: Color(kLightGrey.value),
              initialValue: value,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                hintText: hint,
                hintStyle: subtitlestyle(
                  12,
                  Color(kLightGrey.value),
                  FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardUser() {
    return Container(
      height: 160.h,
      width: 311.w,
      decoration: BoxDecoration(
        color: const Color(0xFF002060),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                left: 25.w,
                top: 37.h,
                bottom: 37.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 40.w,
                    height: 40.h,
                  ),
                  const WidthSpacer(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Angga ',
                              style: titlestyle(
                                18,
                                Color(kLight.value),
                                FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'Praja',
                              style: titlestyle(
                                18,
                                Color(kLight.value),
                                FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      const HeightSpacer(height: 5),
                      Text(
                        'Membership BBLK',
                        style: subtitlestyle(
                          14,
                          Color(kLight.value),
                          FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 48.h,
              width: 311.w,
              padding: EdgeInsets.only(
                left: 16.w,
                top: 5.h,
                bottom: 5.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF1A3E78),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
              ),
              child: Text(
                'Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi',
                style: subtitlestyle(
                  12,
                  Color(kLight.value),
                  FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
