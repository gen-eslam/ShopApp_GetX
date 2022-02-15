import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopapp/routes/routes.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../logic/controller/cart_controller.dart';
import 'color_picker.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  final int category;

  const ImageSliders({Key? key, required this.imageUrl,required this.category}) : super(key: key);

  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  final List<Color> colors = [
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
  ];
  CarouselController controller = CarouselController();
  final cartController = Get.find<CartController>();
  int currentPage = 0;
  int currentColors = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: controller,
          options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
              dotColor: Colors.black,
            ),
          ),
        ),
        if(widget.category==0||widget.category==3)
        Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 200,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentColors = index;
                          });
                        },
                        child: ColorPicker(
                          color: colors[index],
                          outerBorder: currentColors == index,
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 3,
                      ),
                  itemCount: colors.length),
            )),
        Container(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: Colors.white,
                      ),
                    )),
              ),
              Badge(
                position: BadgePosition.topEnd(top: -5, end: -5),
                badgeColor: Colors.red,
                elevation: 0,
                animationDuration: Duration(milliseconds: 300),
                animationType: BadgeAnimationType.slide,
                badgeContent: GetBuilder<CartController>(
                  builder: (_)=>Text(
                    '${cartController.quantity()}',
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.cardScreen);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? pinkClr.withOpacity(0.8)
                          : mainColor.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 15,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
