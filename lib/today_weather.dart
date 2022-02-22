import 'package:flutter/material.dart';

class TodayWeather extends StatelessWidget {
  const TodayWeather({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                
                },
                child: Row(
                  children: [
                    Text(
                      "7 days ",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 30,
            ),
          
          )
        ],
      ),
    );
  }
}