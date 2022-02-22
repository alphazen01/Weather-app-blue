import 'package:flutter/material.dart';
import 'package:weather_app_blue/widget/column_builder.dart';
import 'package:weather_app_blue/widget/custom_card.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        drawer: Drawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlue,
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.more_vert)
            )
          ],
        ),
        body: Column(
          children: [
            Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
            ),
             boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                offset:Offset(0,35),
                spreadRadius: -25
              )
            ]
            ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on,color: Colors.white,),
                      Text(
                        "Dhaka",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                
                  Column(
                    children: [
                      Image.asset("assets/Cloud_3_zap.png",scale: 0.7,),
                      Text(
                        "21°",
                        style: TextStyle(
                        fontSize: 58,
                        color: Colors.white
                       ),
                      ),
                       Text(
                    "Thundrstorm",
                    style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                   ),
                  ),
                  Text(
                    "Monday 17 May ",
                    style: TextStyle(
                    fontSize: 12,
                    color: Colors.white
                   ),
                  ),
                    ],
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.3),
                    indent: 30,
                    endIndent: 30,
                  ),
                 
                  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ColumnBuilder(
                        imageName: "Vector",
                        label: "Humidity",
                      ),
                      ColumnBuilder(
                        imageName: "tabler_wind",
                        label: "Wind",
                      ),
                      ColumnBuilder(
                        imageName: "Vector (2)",
                        label: "Air Pressure",
                      ),
                      ColumnBuilder(
                        imageName: "ic_round-visibility",
                        label: "Visibility",
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Next 7 Days",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.5)
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                        }, 
                        icon: Icon(Icons.arrow_forward_ios,size: 15,
                        color: Colors.white.withOpacity(0.5),)
                        )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
              // reverse: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Custom_Card(
                        imageName: "Sun_cloud_angled_rain",
                        lebel:  "06:00 AM",
                        value: "23°" , 
                        primary:index==0?true:false ,
                      ),
                    ],
                  ),
                );
              }
              ),
            ),
          ],
        ),
      );
  }
}