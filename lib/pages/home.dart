import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty? data : ModalRoute.of(context).settings.arguments;
    // set background image 
    String bgImg = data['isDay']? 'day.jpg': 'night.jpg';
    Color bgColor = data['isDay'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            color: Colors.black26,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/${data["flag"]}'),
                        maxRadius: 15,
                      ),
                      SizedBox(width: 10),
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontFamily: "Times",
                          fontSize: 16,
                          color: Colors.grey[100]
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                   data['time'],
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[100]
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                         data = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDay': result['isDay']
                      };
                      });
                     
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[100]
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(color: Colors.grey[100]),
                      ),
                    
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}