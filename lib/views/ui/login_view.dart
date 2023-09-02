import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:test_vascomm/constants/app_constants.dart';
import 'package:test_vascomm/cubit/login/login_cubit.dart';
import 'package:test_vascomm/injection_container.dart';
import 'package:test_vascomm/routes/app_pages.dart';
import 'package:test_vascomm/utils/result.dart';
import 'package:test_vascomm/views/common/app_style.dart';
import 'package:test_vascomm/views/common/height_spacer.dart';
import 'package:test_vascomm/views/common/width_spacer.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.isLogin?.status == Status.COMPLETED) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.DRAWER,
              (route) => false,
            );
          } else if (state.isLogin?.status == Status.ERROR) {
            showDialog(
              context: context,
              builder: (context) {
                return alert(state.isLogin?.message ?? '');
              },
            );
          }
        },
        builder: (context, state) {
          if (state.isLogin?.status == Status.LOADING) {
            return buildBody(true);
          } else {
            return buildBody(false);
          }
        },
      ),
    );
  }

  Widget alert(String message) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            'assets/json/error.json',
            height: 150.h,
            width: 150.w,
          ),
          const HeightSpacer(height: 26),
          Text(
            'Error',
            style: titlestyle(
              16,
              const Color(0xFF43484B),
              FontWeight.w600,
            ),
          ),
        ],
      ),
      content: Text(
        message,
        style: titlestyle(
          14,
          const Color(0xFF6E768A),
          FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: Container(
            height: 30.h,
            width: 101.w,
            margin: EdgeInsets.only(
              bottom: 15.h,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(kDarkBlue.value),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Done',
                style: titlestyle(
                  14,
                  Color(kLight.value),
                  FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildBody(bool isLoading) {
    return LoadingOverlay(
      isLoading: isLoading,
      opacity: .4,
      color: Color(kLightGrey.value),
      progressIndicator: Lottie.asset(
        'assets/json/loading.json',
      ),
      child: ListView(
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
          email(
            emailController,
          ),
          const HeightSpacer(height: 40),
          password(
            passwordController,
          ),
          const HeightSpacer(height: 40),
          loginButton(context),
          const HeightSpacer(height: 30),
          register(context),
          const HeightSpacer(height: 40),
          copyright(),
        ],
      ),
    );
  }

  Widget email(TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
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
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                ),
                hintText: 'Masukkan email anda',
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

  Widget password(TextEditingController controller) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Password',
                    style: titlestyle(
                      16,
                      Color(kDarkBlue.value),
                      FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Lupa Password anda ?',
                      style: subtitlestyle(
                        14,
                        Color(kGrey.value),
                        FontWeight.w600,
                      ),
                    ),
                  ),
                ],
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
                  obscureText: state.isVisible,
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 10.h,
                    ),
                    hintText: 'Masukkan password anda',
                    hintStyle: subtitlestyle(
                      12,
                      Color(kLightGrey.value),
                      FontWeight.w400,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        sl<LoginCubit>().isVisible();
                      },
                      child: Icon(
                        state.isVisible
                            ? FluentIcons.eye_16_filled
                            : FluentIcons.eye_off_16_filled,
                        color: Color(kGrey.value),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget loginButton(BuildContext context) {
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
        onPressed: () {
          sl<LoginCubit>().login({
            'email': emailController.text,
            'password': passwordController.text
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Text(
              'Login',
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
            'Belum punya akun ?',
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
                  context, Routes.REGISTRATION, (route) => false);
            },
            child: Text(
              'Daftar sekarang',
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
