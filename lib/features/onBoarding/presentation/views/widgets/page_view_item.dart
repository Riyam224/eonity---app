import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.smallImg,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  final String image, smallImg;
  final String title, subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.12),
        Image.asset(image, fit: BoxFit.fill),
        SizedBox(height: 80),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 1.33,
          ),
        ),

        SizedBox(
          width: 226,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFE0E4EB),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 1.33,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(smallImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 45),
        SizedBox(
          width: 345,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFC7D2DE),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.50,
            ),
          ),
        ),
      ],
    );
  }
}
