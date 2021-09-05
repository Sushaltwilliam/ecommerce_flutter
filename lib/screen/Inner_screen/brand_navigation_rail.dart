import 'package:flutter/material.dart';

class BrandNavigationRail extends StatelessWidget {
  const BrandNavigationRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            height: size.height * 0.13,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.only(left: 5, right: 5),
            margin: const EdgeInsets.only(right: 2, bottom: 10, top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).backgroundColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('title'),
                            Text('Price'),
                            Text(
                              'Categories Name',
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Container(
              width: size.width * 0.3,
              height: size.height * 0.15,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage('Assets/Images/laptop.jpg'),
                      fit: BoxFit.fill)),
            ),
          )
        ],
      ),
    );
  }
}
