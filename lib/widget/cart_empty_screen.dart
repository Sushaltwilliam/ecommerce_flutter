import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartEmptyScreen extends StatelessWidget {
  const CartEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData =
        Provider.of<DarkThemeProvider>(context, listen: false).dartTheme;
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: themeData ? Colors.black : Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                        'https://dp.image-gmkt.com/dp2016/minishop/2019/10/07/e9ec25cb-5241-4b14-8895-79743ca82070.gif'),
                    fit: BoxFit.fill)),
          ),
          Text(
            'Your Cart is Empty',
            style: GoogleFonts.robotoSlab(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: themeData ? Colors.white : Colors.black,
            ),
          ),
          Text(
            'Let\'s Start Your Shopping With Cute Smile',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoSlab(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: themeData ? Colors.white : Colors.black,
            ),
          ),
          Container(
            height: size.height * 0.05,
            width: size.width * 0.5,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).buttonColor)),
                onPressed: () {},
                child: Text('Shop Now',
                    style: GoogleFonts.robotoSlab(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
