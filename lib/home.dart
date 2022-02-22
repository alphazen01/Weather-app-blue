import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_blue/cash.dart';
import 'package:weather_app_blue/data_set.dart';
import 'package:weather_app_blue/widget/column_builder.dart';
import 'package:weather_app_blue/widget/custom_card.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final String baseUrl="https://api.openweathermap.org/";
  final String apiKey="eee222ea3ece225edcedf966de7163ba";
  final String lat= "23.811358633150626";
  final String lon="90.40008671517185";
  final String api="data/2.5/onecall?";
  
final String units="units=metric&";

  Map weatherData={};
  Future <Map<String,dynamic>> getWeather()async{
    final response = await http.get(Uri.parse
    (baseUrl+api+units+"lat=$lat"+"&"+"lon=$lon"+"&exclude=hourly,daily"+"&appid=$apiKey"));
    if(response.statusCode==200){
     return  weatherData=jsonDecode(response.body);
     
    }
    return <String, dynamic>{"faild":true};
  }
@override
  void initState() {

    super.initState();
  }





   String getTimeFromTimestamp(int timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = new DateFormat('h:mm a');
    return formatter.format(date);
  }

  String getDateFromTimestamp(int timestamp) {
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var formatter = new DateFormat('E');
    return formatter.format(date);
  }
 



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        body: FutureBuilder(
          initialData: cash,
          future: getWeather(),
          builder: (context, snapshot) {
            weatherData=snapshot.data as Map<String,dynamic>;
            return Column(
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
                             "${weatherData["timezone"]}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    
                      Column(
                        children: [
                          Image.network( "http://openweathermap.org/img/w/${weatherData["current"]["weather"][0]["icon"]}.png",),
                          Text(
                             "${(weatherData["current"]["temp"])}°",
                            style: TextStyle(
                            fontSize: 58,
                            color: Colors.white
                           ),
                          ),
                           Text(
                        currentTemp.name,
                        style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                       ),
                      ),
                      Text(
                       "${getDateFromTimestamp(weatherData["current"]["dt"])}",
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
            );
          }
        ),
      );
  }
}