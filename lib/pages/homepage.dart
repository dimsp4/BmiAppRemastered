import 'package:bmi_app/pages/news/news_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'drawer/home_drawer.dart';
import 'drawer/how_calculate.dart';
import 'drawer/how_get_result.dart';
import 'drawer/what_bmi.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 30,
            padding: EdgeInsets.all(20),
            icon: Icon(
              Icons.help,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      drawer: HomeDrawer(),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "How is your\nhealth today?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CalculateButtonNavHome(
                      route: 'bmi',
                      title: 'Body Mass Index',
                    )),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CalculateButtonNavHome(
                        route: 'bmr',
                        title: 'Basal Metabolic Rate',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CalculateButtonNavHome(
                  route: 'rhr',
                  title: 'Rest Heartbeat (RHR)',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Top Health Headlines\nIndonesia",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.7,
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FutureBuilder(
            future: getRequest(),
            builder:
                (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        // width: 200,
                        // padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              snapshot.data![index].urlImage!,
                            ),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [Colors.black, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                snapshot.data![index].title!,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    aspectRatio: 9 / 16,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    initialPage: 0,
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    height: 300,
                    width: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class CalculateButtonNavHome extends StatelessWidget {
  const CalculateButtonNavHome({
    Key? key,
    required this.route,
    required this.title,
  }) : super(key: key);

  final String route, title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.pushNamed(context, route);
      }),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey.withOpacity(0.8),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
