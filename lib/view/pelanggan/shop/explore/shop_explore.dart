import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_garage/common/widgets/categories/shop_categories.dart';
import 'package:mr_garage/view/pelanggan/navbar/pelanggan_navbar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../common/widgets/images/rounded_banner_images.dart';
import '../../../../common/widgets/product/product_card.dart';
import '../../../../utils/global.colors.dart';

class ShopExplore extends StatefulWidget {
  const ShopExplore({super.key});

  _ShopExploreState createState() => _ShopExploreState();
}

class _ShopExploreState extends State<ShopExplore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: PelangganNavBar(),
                        withNavBar: false,
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );
                    },
                    child: Icon(FeatherIcons.arrowLeft),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Belanja',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: GlobalColors.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.name,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 15, bottom: 15),
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: GlobalColors.mainColor, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: GlobalColors.garis, width: 1),
                  ),
                  hintText: 'Mau beli apa?',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Icon(
                      FeatherIcons.search,
                      size: 20,
                      color: GlobalColors.secondColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 130,
        titleSpacing: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: Column(
              children: [
                // -- Banner ad carousel
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    autoPlay: true,
                    initialPage: 0,
                    aspectRatio: 2.0,
                  ),
                  items: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: RoundedBannerImage(
                        imageUrl: 'assets/img/banner/banner-1.jpg',
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: RoundedBannerImage(
                        imageUrl: 'assets/img/banner/banner-2.jpg',
                        onPressed: () {},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: RoundedBannerImage(
                        imageUrl: 'assets/img/banner/banner-3.jpg',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // -- Categories
                SizedBox(
                  height: 109,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ShopCategories(
                        onTap: () {},
                        iconUrl: 'assets/img/icon/icons8-petrol.png',
                        categoriesTitle: 'Oli',
                      ),
                      ShopCategories(
                        onTap: () {},
                        iconUrl: 'assets/img/icon/icons8-tire-track.png',
                        categoriesTitle: 'Ban',
                      ),
                      ShopCategories(
                        onTap: () {},
                        iconUrl: 'assets/img/icon/icons8-car-battery.png',
                        categoriesTitle: 'Aki',
                      ),
                      ShopCategories(
                        onTap: () {},
                        iconUrl: 'assets/img/icon/icons8-light.png',
                        categoriesTitle: 'Lampu',
                      ),
                      ShopCategories(
                        onTap: () {},
                        iconUrl: 'assets/img/icon/icons8-brake-discs.png',
                        categoriesTitle: 'Rem',
                      ),
                      ShopCategories(
                        onTap: () {},
                        iconUrl: 'assets/img/icon/icons8-more.png',
                        categoriesTitle: 'Lainnya',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // -- Penawaran khusus

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Penawaran khusus',
                      style: GoogleFonts.openSans(
                        color: GlobalColors.textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                        minimumSize: const Size(80, 30),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Lihat semua',
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 233,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/cvt.png',
                        productTitle: 'Cvt Yamaha X-ride',
                        productPrice: '1.000.000',
                        productCategory: 'motor',
                        discount: '50',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/ban_michellin.png',
                        productTitle: 'Ban Michellin Pilot Ring',
                        productPrice: '480.000',
                        productCategory: 'motor',
                        discount: '20',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/ban_bridgestone.png',
                        productTitle: 'Bridgestone Dueler',
                        productPrice: '975.000',
                        productCategory: 'mobil',
                        discount: '35',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/aki_gs.png',
                        productTitle: 'Aki Mobil Innova Diesel',
                        productPrice: '1.293.000',
                        productCategory: 'mobil',
                        discount: '40',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // -- Suku cadang favorit

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suku cadang favorit',
                      style: GoogleFonts.openSans(
                        color: GlobalColors.textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                        minimumSize: const Size(80, 30),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Lihat semua',
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 233,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/cvt.png',
                        productTitle: 'Cvt Yamaha X-ride',
                        productPrice: '1.000.000',
                        productCategory: 'motor',
                        discount: '50',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/ban_michellin.png',
                        productTitle: 'Ban Michellin Pilot Ring',
                        productPrice: '480.000',
                        productCategory: 'motor',
                        discount: '20',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/ban_bridgestone.png',
                        productTitle: 'Bridgestone Dueler',
                        productPrice: '975.000',
                        productCategory: 'mobil',
                        discount: '35',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/aki_gs.png',
                        productTitle: 'Aki Mobil Innova Diesel',
                        productPrice: '1.293.000',
                        productCategory: 'mobil',
                        discount: '40',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // -- Promo hari ini

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Promo hari ini',
                      style: GoogleFonts.openSans(
                        color: GlobalColors.textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                        minimumSize: const Size(80, 30),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Lihat semua',
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 233,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/cvt.png',
                        productTitle: 'Cvt Yamaha X-ride',
                        productPrice: '1.000.000',
                        productCategory: 'motor',
                        discount: '50',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/ban_michellin.png',
                        productTitle: 'Ban Michellin Pilot Ring',
                        productPrice: '480.000',
                        productCategory: 'motor',
                        discount: '20',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/ban_bridgestone.png',
                        productTitle: 'Bridgestone Dueler',
                        productPrice: '975.000',
                        productCategory: 'mobil',
                        discount: '35',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/aki_gs.png',
                        productTitle: 'Aki Mobil Innova Diesel',
                        productPrice: '1.293.000',
                        productCategory: 'mobil',
                        discount: '40',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // -- Rekomendasi buat kamu

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rekomendasi buat kamu',
                      style: GoogleFonts.openSans(
                        color: GlobalColors.textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColors.mainColor,
                        minimumSize: const Size(80, 30),
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Lihat semua',
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 233,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/cvt.png',
                        productTitle: 'Cvt Yamaha X-ride',
                        productPrice: '1.000.000',
                        productCategory: 'motor',
                        discount: '50',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/ban_michellin.png',
                        productTitle: 'Ban Michellin Pilot Ring',
                        productPrice: '480.000',
                        productCategory: 'motor',
                        discount: '20',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/ban_bridgestone.png',
                        productTitle: 'Bridgestone Dueler',
                        productPrice: '975.000',
                        productCategory: 'mobil',
                        discount: '35',
                      ),
                      SizedBox(width: 20),
                      ProductCard(
                        onTap: () {},
                        imageUrl: 'assets/img/product/aki_gs.png',
                        productTitle: 'Aki Mobil Innova Diesel',
                        productPrice: '1.293.000',
                        productCategory: 'mobil',
                        discount: '40',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}