import 'package:flutter/material.dart';
import 'package:schedule_states_flutter/Components/size.dart';
import 'package:schedule_states_flutter/Modal/Data.dart';
import '../Components/Widgets/scheduleCard.dart';
import '../Components/constance.dart';
import 'location.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomePageData homeData=HomePageData();
  List<Widget> scheduleCards = [];


  @override
  Widget build(BuildContext context) {
    for (int i = 6, j = 0; i >= 0; i--, j++) {
      scheduleCards.add(ScheduleCard(weekName: homeData.weekNames[j]));
    }

    double H = ScreenSize.Height(context);
    double W = ScreenSize.Width(context);
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back,
            color:HomeThemeColor
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(homeData.AppbarActionText,
              style: TextStyle(
                color: HomeThemeColor
              ),),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pageTitle(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => location()),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      height: H * 0.29,
                      width: W,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/map.png'))
                      ),
                    ),
                    Container(
                      height: H * 0.29,
                      width: W,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_location_outlined,
                          size: 35,
                            color: HomeThemeColor,
                          ),
                          Text(homeData.ClickableLinkText,
                          style: TextStyle(
                            fontSize: 20,
                            color: HomeThemeColor
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ...scheduleCards,
            ],
          ),
        ),

    );
  }

  Widget pageTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 8),
      child: Text(
        homeData.HomePageTitle,
        style: TextStyle(
          color: HomeThemeColor,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
