import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schedule_states_flutter/Components/Widgets/toggleBotton.dart';
import '../constance.dart';
import '../size.dart';

class ScheduleCard extends StatefulWidget {
  ScheduleCard({
    Key? key,
    required this.weekName,
  }) : super(key: key);

  final String weekName;

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  String dropdownfrom = '9:30';
  String dropdownto = '9:30';
  var from = ['9:30', '10:00', '10:30', '11:00', '11:30'];
  var to = ['9:30', '10:00', '10:30', '11:00', '11:30'];

  @override
  Widget build(BuildContext context) {
    double W = ScreenSize.Width(context);
    double H = ScreenSize.Height(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: kThemeDividerColor, // Remove divider line
            ),
            child: ExpansionTile(
              controlAffinity: ListTileControlAffinity.leading,
              tilePadding: EdgeInsets.only(left: 10, right: 10),
              title: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(widget.weekName, style: kWeekNameStyle),
                trailing: ToggleSwitch(),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("From", style: kDropDownTextStyle),
                          dropDown(from, H, W, dropdownfrom, (value) {
                            setState(() {
                              dropdownfrom = value!;
                            });
                          }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("To", style: kDropDownTextStyle),
                          dropDown(to, H, W, dropdownto, (value) {
                            setState(() {
                              dropdownto = value!;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: W * 0.95,
          child: Divider(),
        )
      ],
    );
  }

  Widget dropDown(
      List<String> list,
      double H,
      double W,
      String value,
      void Function(String?) onChanged,
      ) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        underline: null,
        isExpanded: true,
        value: value,
        hint: Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            color: kButtonStyleDataColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
        ),
        iconStyleData: const IconStyleData(
          openMenuIcon: Icon(Icons.arrow_drop_up),
        ),
      ),
    );
  }
}
