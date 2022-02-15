import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/theme.dart';

class SizedList extends StatefulWidget {
  const SizedList({Key? key}) : super(key: key);

  @override
  State<SizedList> createState() => _SizedListState();
}

class _SizedListState extends State<SizedList> {
  final List<String> sizedList = ['S', 'M', 'L', 'XL', 'XXL'];
  int currentSeletected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    currentSeletected = index;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                    color: currentSeletected == index
                        ? Get.isDarkMode
                            ? pinkClr
                            : mainColor
                        : Get.isDarkMode?Colors.black:Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.4), width: 2),
                  ),
                  child: Text(
                    sizedList[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: currentSeletected == index
                            ? Colors.white
                            : Get.isDarkMode?Colors.white:Colors.black),
                  ),
                ));
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: sizedList.length),
    );
  }
}
