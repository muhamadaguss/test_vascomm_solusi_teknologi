import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:test_vascomm/constants/app_constants.dart';
import 'package:test_vascomm/views/common/drawer/drawer_widget.dart';
import '../common/app_style.dart';
import '../common/height_spacer.dart';
import '../common/width_spacer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> listproduct = [
    {
      'title': 'All Products',
      'isActive': true,
    },
    {
      'title': 'Layanan Kesehatan',
      'isActive': false,
    },
    {
      'title': 'Alat Kesehatan',
      'isActive': false,
    },
  ];

  List<Map<String, dynamic>> listproductVertical = [
    {
      'title': 'PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja',
      'price': 'Rp. 1.400.000',
      'place': 'Lenmarc Surabaya',
      'location': 'Dukuh Pakis, Surabaya',
      'image': 'assets/images/product1.png',
    },
    {
      'title': 'PCR Swab Test (Drive Thru) Hasil 1 Hari Kerja',
      'price': 'Rp. 1.400.000',
      'place': 'Lenmarc Surabaya',
      'location': 'Dukuh Pakis, Surabaya',
      'image': 'assets/images/product2.png',
    },
  ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeightSpacer(height: 40),
            promo(),
            const HeightSpacer(height: 45),
            vaksin(),
            const HeightSpacer(height: 40),
            tracking(),
            const HeightSpacer(height: 40),
            search(),
            const HeightSpacer(height: 40),
            listProduct(),
            const HeightSpacer(height: 40),
            tabSection(context),
            const HeightSpacer(height: 40),
          ],
        ),
      ),
    );
  }

  Widget promo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 150.h,
        color: Colors.white,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 131.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.r),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/background.png',
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(kDarkBlue.value).withOpacity(.2),
                    blurRadius: 15.0,
                    offset: const Offset(0.0, 10),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -15.w,
              top: -55.h,
              child: Image.asset(
                'assets/images/calendar.png',
                height: 200.h,
                width: 150.w,
              ),
            ),
            Positioned(
              top: 32.h,
              left: 16.w,
              child: SizedBox(
                width: 193.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Solusi, ',
                            style: titlestyle(
                              18,
                              Color(kDarkBlue.value),
                              FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Kesehatan Anda',
                            style: titlestyle(
                              18,
                              Color(kDarkBlue.value),
                              FontWeight.w800,
                            ),
                          )
                        ],
                      ),
                    ),
                    const HeightSpacer(height: 10),
                    Text(
                      'Update informasi seputar kesehatan semua bisa disini !',
                      style: subtitlestyle(
                        12,
                        Color(kGrey.value),
                        FontWeight.w400,
                      ),
                    ),
                    const HeightSpacer(height: 10),
                    Container(
                      height: 32.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Color(kDarkBlue.value),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          'Selengkapnya',
                          style: titlestyle(
                            12,
                            Color(kLight.value),
                            FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget vaksin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 150.h,
        color: Colors.white,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 131.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(kDarkBlue.value).withOpacity(.15),
                    blurRadius: 15.0,
                    offset: const Offset(0.0, 10),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10.w,
              top: -30.h,
              child: Image.asset(
                'assets/images/virus.png',
                height: 100.h,
                width: 101.w,
              ),
            ),
            Positioned(
              top: 32.h,
              left: 16.w,
              child: SizedBox(
                width: 173.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Layanan Khusus',
                      style: titlestyle(
                        18,
                        Color(kDarkBlue.value),
                        FontWeight.w600,
                      ),
                    ),
                    const HeightSpacer(height: 10),
                    Text(
                      'Tes Covid 19, Cegah Corona Sedini Mungkin',
                      style: subtitlestyle(
                        12,
                        Color(kGrey.value),
                        FontWeight.w400,
                      ),
                    ),
                    const HeightSpacer(height: 10),
                    Container(
                      height: 32.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Color(kLight.value),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Daftar Tes',
                            style: titlestyle(
                              12,
                              Color(kDarkBlue.value),
                              FontWeight.w600,
                            ),
                          ),
                          const WidthSpacer(width: 5),
                          Icon(
                            FluentIcons.arrow_right_16_filled,
                            color: Color(kDarkBlue.value),
                            size: 15.sp,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tracking() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: 150.h,
        color: Colors.white,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 131.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(kDarkBlue.value).withOpacity(.15),
                    blurRadius: 15.0,
                    offset: const Offset(0.0, 10),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20.w,
              top: -15.h,
              child: Image.asset(
                'assets/images/search.png',
                height: 100.h,
                width: 101.w,
              ),
            ),
            Positioned(
              top: 32.h,
              right: 20.w,
              child: SizedBox(
                width: 175.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Track Pemeriksaan',
                      style: titlestyle(
                        18,
                        Color(kDarkBlue.value),
                        FontWeight.w600,
                      ),
                    ),
                    const HeightSpacer(height: 10),
                    Text(
                      'Kamu dapat mengecek progress pemeriksaanmu disini',
                      style: subtitlestyle(
                        12,
                        Color(kGrey.value),
                        FontWeight.w400,
                      ),
                    ),
                    const HeightSpacer(height: 10),
                    Container(
                      height: 32.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: Color(kLight.value),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Track',
                            style: titlestyle(
                              12,
                              Color(kDarkBlue.value),
                              FontWeight.w600,
                            ),
                          ),
                          const WidthSpacer(width: 5),
                          Icon(
                            FluentIcons.arrow_right_16_filled,
                            color: Color(kDarkBlue.value),
                            size: 15.sp,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget search() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: Color(kLight.value),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(kDarkBlue.value).withOpacity(.15),
                  blurRadius: 20.0,
                  offset: const Offset(0.0, 10),
                )
              ],
            ),
            child: Center(
              child: Icon(
                Icons.filter_list,
                color: Color(
                  kDarkBlue.value,
                ),
              ),
            ),
          ),
          Container(
            width: 265.w,
            height: 40.h,
            padding: EdgeInsets.only(
              left: 30.w,
              right: 12.w,
            ),
            decoration: BoxDecoration(
              color: Color(kLight.value),
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: Color(kDarkBlue.value).withOpacity(.15),
                  blurRadius: 20.0,
                  offset: const Offset(0.0, 10),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: subtitlestyle(
                    16,
                    Color(kLightGrey.value),
                    FontWeight.w400,
                  ),
                ),
                Icon(
                  LineIcons.search,
                  color: Color(
                    kDarkBlue.value,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listProduct() {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: listproduct.length,
            separatorBuilder: (context, index) => const WidthSpacer(width: 20),
            itemBuilder: (context, index) {
              final item = listproduct[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    for (var element in listproduct) {
                      element['isActive'] = false;
                    }
                    item['isActive'] = true;
                  });
                },
                child: Container(
                  height: 50.h,
                  margin: EdgeInsets.only(
                    top: 5.h,
                    bottom: 5.h,
                    left: index == 0 ? 20.w : 0,
                    right: index == listproduct.length - 1 ? 20.w : 0,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 7.h),
                  decoration: BoxDecoration(
                      color: item['isActive']
                          ? Color(kDarkBlue.value)
                          : Color(kLight.value),
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: Color(kDarkBlue.value).withOpacity(.2),
                          blurRadius: 20.0,
                          offset: const Offset(0.0, 10),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      item['title'],
                      style: subtitlestyle(
                        12,
                        item['isActive']
                            ? Color(kLight.value)
                            : Color(kDarkBlue.value),
                        FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const HeightSpacer(height: 26),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: listproduct.length,
            separatorBuilder: (context, index) => const WidthSpacer(width: 20),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50.h,
                  width: 160.w,
                  margin: EdgeInsets.only(
                    top: 10.h,
                    bottom: 10.h,
                    left: index == 0 ? 20.w : 0,
                    right: index == listproduct.length - 1 ? 20.w : 0,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
                  decoration: BoxDecoration(
                      color: Color(kLight.value),
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: Color(kDarkBlue.value).withOpacity(.2),
                          blurRadius: 20.0,
                          offset: const Offset(0.0, 10),
                        )
                      ]),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/images/stetoskop.png',
                              height: 80.h,
                              width: 80.w,
                            ),
                          ),
                          const HeightSpacer(height: 10),
                          Text(
                            'Suntik Steril',
                            style: subtitlestyle(
                              14,
                              Color(kDarkBlue.value),
                              FontWeight.w600,
                            ),
                          ),
                          const HeightSpacer(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Rp. 10.000',
                                style: subtitlestyle(
                                  12,
                                  Color(kOrange.value),
                                  FontWeight.w600,
                                ),
                              ),
                              Container(
                                height: 18.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(kLightGreen.value),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'Ready Stok',
                                    style: subtitlestyle(
                                      12,
                                      Color(kDarkGreen.value),
                                      FontWeight.w600,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 5.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              height: 20.h,
                              width: 20.w,
                            ),
                            const WidthSpacer(width: 5),
                            Text(
                              '5',
                              style: subtitlestyle(
                                16,
                                Color(kLightGrey.value),
                                FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget tabSection(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
                Tab(text: "Satuan"),
                Tab(text: "Paket Pemeriksaan"),
              ],
            ),
          ),
          const HeightSpacer(height: 30),
          SizedBox(
            height: 350.h,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                listProductVertical(),
                listProductVertical(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listProductVertical() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listproductVertical.length,
      separatorBuilder: (context, index) => const HeightSpacer(height: 30),
      itemBuilder: (context, index) {
        final item = listproductVertical[index];
        return Container(
          height: 150.h,
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: Color(kLight.value),
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Color(kDarkBlue.value).withOpacity(.16),
                blurRadius: 20.0,
                offset: const Offset(0.0, 10),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 200.w,
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 10.h,
                  bottom: 15.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title'],
                      style: subtitlestyle(
                        14,
                        Color(kDarkBlue.value),
                        FontWeight.w600,
                      ),
                    ),
                    const HeightSpacer(height: 12),
                    Text(
                      item['price'],
                      style: subtitlestyle(
                        14,
                        Color(kOrange.value),
                        FontWeight.w600,
                      ),
                    ),
                    const HeightSpacer(height: 10),
                    Row(
                      children: [
                        Icon(
                          LineIcons.building,
                          size: 14.sp,
                        ),
                        const WidthSpacer(width: 5),
                        Text(
                          item['place'],
                          style: subtitlestyle(
                            14,
                            Color(kDarkBlue.value),
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const HeightSpacer(height: 8),
                    Row(
                      children: [
                        Icon(
                          LineIcons.mapMarker,
                          size: 12.sp,
                        ),
                        const WidthSpacer(width: 5),
                        Text(
                          item['location'],
                          style: subtitlestyle(
                            12,
                            Color(kDarkBlue.value),
                            FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Image.asset(
                item['image'],
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }
}
