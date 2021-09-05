import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarousalSliderWid extends StatefulWidget {
  const CarousalSliderWid({Key? key}) : super(key: key);

  @override
  _CarousalSliderWidState createState() => _CarousalSliderWidState();
}

class _CarousalSliderWidState extends State<CarousalSliderWid> {
  CarouselController buttonCarouselController = CarouselController();
  int currentIndex = 0;
  List images = [
    'https://www.bajajfinserv.in/Top_Vivo_Upcoming_Mobile_Phones_in_2020-Banner_Upcoming-Vivo-Cluster_Img1.jpg',
    'https://www.beyoung.in/api/cache/catalog/category-banner/mobile/mobileView_men_graphic_category_banner-_767x430.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d8a427104454435.5f634129afe77.jpg',
    'https://storage.pixteller.com/designs/designs-images/2020-12-21/05/laptop-new-arrival-sales-banner-1-5fe0c47813869.png',
    'https://i0.wp.com/rsystems.co.in/wp-content/uploads/2021/05/ef8083bfe79088dc00bd8eca9c821cd5.jpg?fit=2561%2C866&ssl=1'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              height: 400.0),
          items: images.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        img,
                        fit: BoxFit.fill,
                      ),
                    ));
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              images.length,
              (index) => Container(
                    margin: const EdgeInsets.all(3),
                    width: currentIndex == index ? 20 : 5,
                    height: currentIndex == index ? 10 : 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      shape: BoxShape.rectangle,
                      color:
                          currentIndex == index ? Colors.purple : Colors.white,
                    ),
                  )),
        )
      ],
    );
  }
}
