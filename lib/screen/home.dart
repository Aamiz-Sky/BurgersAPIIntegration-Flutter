import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String stringResponse = '';
  List <dynamic> listResponse = [];

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://free-food-menus-api-two.vercel.app/burgers"));
    if(response.statusCode == 200){
      setState(() {
        //stringResponse = response.body;
        listResponse = json.decode(response.body) as List<dynamic>;
      });
    }
  }
  @override
  void initState() {
    apicall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/burger.png', // Specify your image path here
                  height: 50,
                ),
                SizedBox(width: 10), // Add spacing between image and text
                Text("Grillified Burgers"),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),

        body: ListView.builder(itemBuilder: (context, index){
        if(listResponse[index]['img'] == null || listResponse[index]['img'].isEmpty){
          return Container();
        };
        return Container(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  spreadRadius: 3
                )
            ],
        ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    listResponse[index]['img'],
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Image loaded successfully
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Text('Image not available');
                    },
                  ),
                ),
                Text(listResponse[index]['name'],style: TextStyle(fontSize: 28,fontFamily: 'JosefinSans-Italic-VariableFont_wght'),),
                Container(
                  margin: EdgeInsets.only(top: 5),
                    child: Text('Price: ${listResponse[index]['price']}'.toString(),style: TextStyle(fontSize: 15),)),
                Container(
                  margin: EdgeInsets.only(top: 5),
                    child: Text('Description: ${listResponse[index]['dsc']}'.toString(),style: TextStyle(fontSize: 15),))
              ],
            ),
          ),
        );
      },
      itemCount: listResponse == null? 0: listResponse.length,
      ));
  }
}
