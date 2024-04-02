import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_states_flutter/Modal/Data.dart';

import '../Components/constance.dart';
import '../Components/size.dart';

class location extends StatefulWidget {
  const location({super.key});

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  LocationPageData locationData=LocationPageData();
  bool setLocation=false;
  @override
  Widget build(BuildContext context) {
    double H = ScreenSize.Height(context);
    double W = ScreenSize.Width(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                        hintText: locationData.LocationHintText,
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
                      LocationButton(onPressed: (){
                        setState(() {
                          setLocation=true;
                        });
                        }, Title: locationData.LocationButtonText1, color: LocationButtonColor,),
                      LocationButton(onPressed: (){
                        Navigator.pop(context);
                      }, Title: locationData.LocationButtonText2, color: Colors.white,)
                    ],
                  ),
                )
              ],
            ),
          ),
          if(setLocation)
            Stack(
              children: [
              Container(
                width: W,
                height: H,
                color: Colors.black.withOpacity(0.5),
              ),
                SingleChildScrollView(
                  child: Container(
                    width: W,
                    height: H,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(1, 2),
                          blurRadius: 3,
                          spreadRadius: 0,
                        ),
                      ]
                    ),
                    child: Center(
                      child: Container(
                        width: W,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(locationData.LocationDialogeboxTitle,
                                    style: TextStyle(
                                      color:LocationSearchTitleColor,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        setLocation=false;
                                      });
                                    },
                                    child: Icon(Icons.close_outlined),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            Container(
                              width: W,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: LocationSearchTextField
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    labelText: locationData.LocationDialogeboxlabelText,
                                    fillColor: Colors.transparent,
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    suffixIconColor: LocationSearchTextFieldIconColor,
                                    prefixIconColor: LocationSearchTextFieldIconColor,
                                    border: InputBorder.none

                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            LocationButton(
                              onPressed: (){},
                              Title: locationData.LocationDialogeboxButton,
                              color: LocationAlertWidgetButtonColor,
                              TColor: LocationAlertWidgetButtonTextColor,
                            ),
                            SizedBox(height: 15),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
    this.TColor
  });
  final Function onPressed;
  final String Title;
  final Color color;
  Color?TColor;

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
            widget.onPressed();
            },
            child: Text('${widget.Title}',
            style: TextStyle(
              color: widget.TColor??LocationButtonTextColor
            ),),
        ),
      ),
    );
  }
}
