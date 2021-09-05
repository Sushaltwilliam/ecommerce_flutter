import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  final int index;
  CategoriesWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  List<Map<String, dynamic>> _categories = [
    {
      'categoryName': 'Phone',
      'categoryImage': 'Assets/Images/mobile-phone.jpg'
    },
    {
      'categoryName': 'Cloths',
      'categoryImage': 'Assets/Images/cloths-image.jpg'
    },
    {'categoryName': 'Shoes', 'categoryImage': 'Assets/Images/shoes.jpeg'},
    {'categoryName': 'Beauty', 'categoryImage': 'Assets/Images/beauty.jpg'},
    {'categoryName': 'Laptop', 'categoryImage': 'Assets/Images/laptop.jpg'},
    {
      'categoryName': 'Furniture',
      'categoryImage': 'Assets/Images/furniture.jpeg'
    },
    {'categoryName': 'Watches', 'categoryImage': 'Assets/Images/watches.jpg'}
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                          _categories[widget.index]['categoryImage']),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              width: 150,
              child: Text(
                _categories[widget.index]['categoryName'],
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ));
  }
}
