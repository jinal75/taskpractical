import 'package:flutter/material.dart';
import 'package:flutter/material.dart';



class Categorydetailpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Detail',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Categorydetailpage(),
    );
  }
}

class Categorydetail extends StatelessWidget {
  final List<String> imageUrls = [
    'https://image-marketing.s3.ap-south-1.amazonaws.com/wp-content/uploads/2021/10/19164205/Bridal-Jewelry-1068x580.jpg.webp',
    'https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/09/bridal-jwellery.jpg',
    'https://www.anuradhaartjewellery.com/blog/wp-content/uploads/2018/11/Bipasha-Basu-Wedding-Photo.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
      ),
      body: Center(
        child: ProductDetailSlideshow(imageUrls: imageUrls),
      ),
    );
  }
}

class ProductDetailSlideshow extends StatefulWidget {
  final List<String> imageUrls;

  ProductDetailSlideshow({required this.imageUrls});

  @override
  _ProductDetailSlideshowState createState() => _ProductDetailSlideshowState();
}

class _ProductDetailSlideshowState extends State<ProductDetailSlideshow> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 500,
          child: Stack(
            children: [
              PageView.builder(
                itemCount: widget.imageUrls.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    margin: EdgeInsets.all(10),
                    child: Image.network(
                      widget.imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              // Positioned(
              //   bottom: 20,
              //   left: 0,
              //   right: 0,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: _buildPageIndicator(),
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Image ${_currentIndex + 1}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < widget.imageUrls.length; i++) {
      indicators.add(
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }

    return indicators;
  }
}
