import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_vascomm/cubit/register/register_cubit.dart';

import '../../constants/app_constants.dart';
import '../../injection_container.dart';
import '../../routes/app_pages.dart';
import '../common/app_style.dart';
import '../common/height_spacer.dart';
import '../common/width_spacer.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HeightSpacer(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hai, ',
                        style: titlestyle(
                          28,
                          Color(kDarkBlue.value),
                          FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'Selamat Datang',
                        style: titlestyle(
                          28,
                          Color(kDarkBlue.value),
                          FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'Silahkan login untuk melanjutkan',
                  style: subtitlestyle(
                    12,
                    Color(kGrey.value),
                    FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const HeightSpacer(height: 11),
          Image.asset(
            'assets/images/banner.png',
            fit: BoxFit.cover,
            height: 280.h,
            width: 331.w,
          ),
          Row(
            children: [
              Expanded(
                child: textField(
                  'Nama Depan',
                  'Nama Depan anda',
                  TextInputType.name,
                ),
              ),
              Expanded(
                child: textField(
                  'Nama Belakang',
                  'Nama Belakang anda',
                  TextInputType.name,
                ),
              ),
            ],
          ),
          const HeightSpacer(height: 40),
          textField(
            'No. KTP',
            'Masukkan No. KTP anda',
            TextInputType.number,
          ),
          const HeightSpacer(height: 40),
          textField(
            'Email',
            'Masukkan email anda',
            TextInputType.emailAddress,
          ),
          const HeightSpacer(height: 40),
          textField(
            'No. Telepon',
            'Masukkan No. Telepon anda',
            TextInputType.phone,
          ),
          const HeightSpacer(height: 40),
          password(
            'Password',
            'Masukkan password anda',
            TextInputType.visiblePassword,
          ),
          const HeightSpacer(height: 40),
          confirmpassword(
            'Konfirmasi Password',
            'Konfirmasi password anda',
            TextInputType.visiblePassword,
          ),
          const HeightSpacer(height: 40),
          registerButton(),
          const HeightSpacer(height: 30),
          register(context),
          const HeightSpacer(height: 40),
          copyright(),
        ],
      ),
    );
  }

  Widget textField(
    String title,
    String hintTitle,
    TextInputType keyboardType,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            child: TextField(
              cursorColor: Color(kLightGrey.value),
              keyboardType: keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                hintText: hintTitle,
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

  Widget password(
    String title,
    String hintTitle,
    TextInputType keyboardType,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return TextField(
                  cursorColor: Color(kLightGrey.value),
                  keyboardType: keyboardType,
                  obscureText: state.isPasswordVisible,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    hintText: hintTitle,
                    hintStyle: subtitlestyle(
                      12,
                      Color(kLightGrey.value),
                      FontWeight.w400,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        sl<RegisterCubit>().isPasswordVisible();
                      },
                      child: Icon(
                        state.isPasswordVisible
                            ? FluentIcons.eye_16_filled
                            : FluentIcons.eye_off_16_filled,
                        color: Color(kGrey.value),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget confirmpassword(
    String title,
    String hintTitle,
    TextInputType keyboardType,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return TextField(
                  cursorColor: Color(kLightGrey.value),
                  keyboardType: keyboardType,
                  obscureText: state.isConfirmPasswordVisible,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    hintText: hintTitle,
                    hintStyle: subtitlestyle(
                      12,
                      Color(kLightGrey.value),
                      FontWeight.w400,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        sl<RegisterCubit>().isConfirmPasswordVisible();
                      },
                      child: Icon(
                        state.isConfirmPasswordVisible
                            ? FluentIcons.eye_16_filled
                            : FluentIcons.eye_off_16_filled,
                        color: Color(kGrey.value),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget registerButton() {
    return Container(
      height: 48.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(kDarkBlue.value),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          shadowColor: Color(kDarkBlue.value),
          elevation: 6,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Text(
              'Register',
              style: titlestyle(
                16,
                Color(kLight.value),
                FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(
              FluentIcons.arrow_right_16_filled,
            ),
          ],
        ),
      ),
    );
  }

  Widget register(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sudah punya akun ?',
            style: subtitlestyle(
              14,
              Color(kLightGrey.value),
              FontWeight.w400,
            ),
          ),
          const WidthSpacer(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.LOGIN, (route) => false);
            },
            child: Text(
              'Login sekarang',
              style: subtitlestyle(
                14,
                Color(kDarkBlue.value),
                FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget copyright() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.copyright,
            color: Color(kLightGrey.value),
            size: 12.sp,
          ),
          const WidthSpacer(width: 5),
          Text(
            'SILK. all right reserved.',
            style: subtitlestyle(
              12,
              Color(kLightGrey.value),
              FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
