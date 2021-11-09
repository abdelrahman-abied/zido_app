import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:zido_app/utils/components.dart';
import 'package:zido_app/utils/style.dart';

class ZidoSlider extends StatefulWidget {
  ZidoSlider({Key? key}) : super(key: key);

  @override
  _ZidoSliderState createState() => _ZidoSliderState();
}

class _ZidoSliderState extends State<ZidoSlider> {
  final List sliderListTitle = [
    'احصل على 10 نقاط مع كل تسجيل',
    'احصل على 10 نقاط مع كل تسجيل',
    'احصل على 10 نقاط مع كل تسجيل'
  ];
  final List sliderListSubTitle = [
    'انشر التطبيق واربح نقاط زيدو مجانية',
    'انشر التطبيق واربح نقاط زيدو مجانية',
    'انشر التطبيق واربح نقاط زيدو مجانية',
  ];
  int _activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: sliderListTitle.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                width: double.infinity,
                color: secondaryColor,
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sliderListTitle[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            sliderListSubTitle[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                getString(context, 'publish'),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  backgroundColor: hintColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/coins.png',
                        fit: BoxFit.contain,
                      ),
                    )
                  ],
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _activeIndex = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Positioned(
          bottom: 10,
          left: MediaQuery.of(context).size.width / 2 - 25,
          right: MediaQuery.of(context).size.width / 2 - 25,
          child: AnimatedSmoothIndicator(
            effect: const WormEffect(
              dotWidth: 16.0,
              dotHeight: 4.0,
              dotColor: Colors.white,
              activeDotColor: hintColor,
            ),
            activeIndex: _activeIndex,
            count: sliderListTitle.length,
          ),
        ),
      ],
    );
  }
}
