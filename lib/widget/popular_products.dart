import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularProductWid extends StatelessWidget {
  const PopularProductWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(15),
      width: size.width * 0.4,
      height: size.height * 0.32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://rps-assets.azureedge.net/media/2gubwxky/fujifilm-x-t10-by-math.jpg?mode=max&width=1520&rnd=132446433313430000'),
                          fit: BoxFit.fill)),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    EvaIcons.heartOutline,
                    color: Colors.red,
                  ))
            ],
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Title',
                      style: GoogleFonts.robotoSlab(fontSize: 18),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Rs: 123',
                        style: GoogleFonts.robotoSlab(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description',
                      overflow: TextOverflow.ellipsis,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(EvaIcons.shoppingCartOutline))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
