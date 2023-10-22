import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNewsCardWidget extends StatelessWidget {
  const ShimmerNewsCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Color(0xFFE9EEFA),
                highlightColor: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFE9EEFA),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Shimmer.fromColors(
                baseColor: Color(0xFFE9EEFA),
                highlightColor: Colors.white,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFE9EEFA),
                  ),
                ),
              ),
            ],
          ),
        ),
        Shimmer.fromColors(
          baseColor: Color(0xFFE9EEFA),
          highlightColor: Colors.white,
          child: Container(
            width: 110,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey,
                ),
          ),
        ),
      ],
    );
  }
}
