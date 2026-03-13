import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: PageView(
        children: [
          banner("assets/banner1.jpg"),
        ],
      ),
    );
  }

Widget banner(String url) {

  return Padding(
    padding: const EdgeInsets.all(8),

    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),

      child: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              url,
              fit: BoxFit.cover, // fills entire banner
            ),
          ),

          Center(
            child: Text(
              "Come and Buy\nWhatever You Want",

              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

                shadows: [
                  Shadow(
                    blurRadius: 6,
                    color: Colors.black54,
                    offset: Offset(2,2),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    ),
  );
}
}