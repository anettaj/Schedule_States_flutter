import 'package:flutter/cupertino.dart';
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
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: W*0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: LocationSearchTextField,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.tune),
                        hintText: "Search address",
                        hintStyle: TextStyle(
                          color: LocationSearchTextFieldHintColor
                        ),
                        suffixIconColor: LocationSearchTextFieldIconColor,
                        prefixIconColor: LocationSearchTextFieldIconColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color:LocationSearchTextFieldBorderColor
                          )
                        )
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      LocationButton(onPressed: (){}, Title: 'Set Location', color: LocationButtonColor,),
                      LocationButton(onPressed: (){}, Title: 'Cancel', color: Colors.white,)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}

class LocationButton extends StatefulWidget {
  LocationButton({
    Key?key,
    required this.onPressed,
    required this.Title,
    required this.color,
  });
  final Function onPressed;
  final String Title;
  final Color color;

  @override
  State<LocationButton> createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 4,
        shadowColor: Colors.black26,
        borderRadius: BorderRadius.circular(10),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.all(15),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              widget.color,
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 0),
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),

          ),
            onPressed: (){
            widget.onPressed;
            },
            child: Text('${widget.Title}',
            style: TextStyle(
              color: LocationButtonTextColor
            ),),
        ),
      ),
    );
  }
}
