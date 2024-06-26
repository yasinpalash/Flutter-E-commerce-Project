import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/Presentation/ui/Utility/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/Banner.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({
    super.key,
    this.height, required this.bannerList,
  });
  final double? height;
  final List<BannerItem> bannerList;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: widget.height ?? 160.0,
              onPageChanged: (index, reason) {
                _currentIndex.value = index;
              },
              viewportFraction: 1,
              autoPlay: false,
          ),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                        image: DecorationImage(image: NetworkImage(banner.image??'')), borderRadius: BorderRadius.circular(8),

                        ),
                        alignment: Alignment.center,
                    ),
                    Column(
                      children: [
                        SizedBox(
                            width:100,
                            child: Text(banner.shortDes??"")),
                        SizedBox(
                            width:100,
                            child: Text(banner.title??"")),
                      ],
                    )

                  ],
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 6,
        ),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Container(
                    height: 14,
                    width: 14,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color:
                            i == index ? AppColors.primaryColor : Colors.white,
                        border: Border.all(
                          color:
                              i == index ? AppColors.primaryColor : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(30)),
                  ),
              ],
            );
          },
        )
      ],
    );
  }
}
