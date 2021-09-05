import 'package:ecommerce/screen/Inner_screen/brand_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class PopularBrandWid extends StatefulWidget {
  const PopularBrandWid({
    Key? key,
  }) : super(key: key);

  @override
  _PopularBrandWidState createState() => _PopularBrandWidState();
}

class _PopularBrandWidState extends State<PopularBrandWid> {
  List _brandImage = [
    'https://i.pinimg.com/originals/30/bb/40/30bb40c10cad29e6a42a6dd029bb5c62.jpg',
    'https://s.sdgcdn.com/7/2017/12/Dell-Brand-Page-Banner-3.jpg',
    'https://i.pinimg.com/originals/a8/95/62/a895623e7bbeb9314e715476f4df9afc.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img20/Wireless/SamsungBAU/S20FE/Pre-Order/V253215456_IN_WLME_SamsungGalaxy_S20_GA__S20-FE_1242x450._SX1242_CB403247530_.jpg',
    'https://consumer-img.huawei.com/content/dam/huawei-cbg-site/south-pacific/au/mkt/press/news/2019/100-million-shipment/banner.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        // control: SwiperPagination.fraction,
        autoplay: true,
        onTap: (index) {
          Navigator.of(context)
              .pushNamed(BrandNavigationScreen.routeName, arguments: {index});
        },
        itemCount: _brandImage.length,
        itemBuilder: (ctx, index) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'Assets/Images/image.gif',
                    fit: BoxFit.fill,
                    fadeInDuration: Duration(seconds: 3),
                    image: _brandImage[index],
                  )),
            ),
          );
        },
      ),
    );
  }
}
