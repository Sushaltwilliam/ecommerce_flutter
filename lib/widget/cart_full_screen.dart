import 'package:ecommerce/provider/dark_theme_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FullCartScreen extends StatefulWidget {
  const FullCartScreen({Key? key}) : super(key: key);

  @override
  _FullCartScreenState createState() => _FullCartScreenState();
}

class _FullCartScreenState extends State<FullCartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeDate =
        Provider.of<DarkThemeProvider>(context, listen: false).dartTheme;
    return SafeArea(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              margin: const EdgeInsets.all(5),
              height: size.height * 0.2,
              width: size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white60),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.38,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://rps-assets.azureedge.net/media/2gubwxky/fujifilm-x-t10-by-math.jpg?mode=max&width=1520&rnd=132446433313430000',
                            fit: BoxFit.fill,
                          ),
                        )),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Name of Product',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.highlight_remove_outlined,
                                )),
                          ],
                        ),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Price Rs : ',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.grey, fontSize: 14)),
                          TextSpan(
                              text: '100',
                              style: TextStyle(
                                  color:
                                      themeDate ? Colors.white : Colors.purple,
                                  fontWeight: FontWeight.bold))
                        ])),
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Quantity : ',
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.grey, fontSize: 14)),
                          TextSpan(
                              text: '1',
                              style: TextStyle(
                                  color:
                                      themeDate ? Colors.white : Colors.purple,
                                  fontWeight: FontWeight.bold))
                        ])),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.orangeAccent[100],
                                    borderRadius: BorderRadius.circular(8)),
                                width: 25,
                                height: 25,
                                child: Center(child: Icon(Icons.remove)),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '1',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent[100],
                                      borderRadius: BorderRadius.circular(8)),
                                  width: 25,
                                  height: 25,
                                  child: Center(child: Icon(Icons.add))),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 14, bottom: 10),
              child: Text(
                'Shipping Free',
                style: TextStyle(
                    fontSize: 10,
                    color: themeDate ? Colors.white : Colors.black),
              )),
        ],
      ),
    );
  }
}
