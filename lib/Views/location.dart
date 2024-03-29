import 'package:flutter/material.dart';

import '../Components/constance.dart';
import '../Components/size.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    double W = ScreenSize.Width(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: W,
            height: H,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/MapToFoodTruck.png')
              )
            ),
          ),
          Column(
            children: [
              TextField(),
              Column(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(LocationButtonColor)
                    ),
                      onPressed: (){},
                      child: Text('Set Location'),
                  )
                ],
              )
            ],
          )
        ],
      )
    );
  }
}
