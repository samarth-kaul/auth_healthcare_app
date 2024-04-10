import 'package:auth_healthcare_app/widgets/calender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DocScreen extends StatefulWidget {
  String dp;
  String name;
  String designation;
  double distance;
  double rating;
  DocScreen(
      {required this.name,
      required this.designation,
      required this.distance,
      required this.dp,
      required this.rating});

  @override
  State<DocScreen> createState() => _DocScreenState();
}

class _DocScreenState extends State<DocScreen> {
  List<String> getConsecutiveDays(DateTime startDate, int numberOfMonths) {
    List<String> daysList = [];
    for (int i = 0; i < 30; i++) {
      // DateTime newDate = startDate.add(Duration(days: 30 * i));
      // String monthText = DateFormat('MMMM yyyy').format(newDate);
      // monthsList.add(monthText);
      DateTime newDate = startDate.add(Duration(days: i + 1));
      String formattedDay = DateFormat('dd').format(newDate);
      daysList.add(formattedDay);
    }
    return daysList;
  }

  List<String> getConsecutiveMonths(DateTime startDate, int numberOfMonths) {
    List<String> monthsList = [];
    for (int i = 0; i < numberOfMonths; i++) {
      DateTime newDate = startDate.add(Duration(days: 30 * i));
      String monthText = DateFormat('MMMM').format(newDate);
      monthsList.add(monthText.substring(0, 3));
    }
    return monthsList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getConsecutiveMonths(DateTime.now(), 12);
  }

  @override
  Widget build(BuildContext context) {
    List<String> consecutiveMonths = getConsecutiveMonths(DateTime.now(), 6);
    List<String> consecutiveDays = getConsecutiveDays(DateTime.now(), 6);
    var size = MediaQuery.of(context).size;
    var sHeight = size.height;
    var sWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Doctor Detail",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(bottom: 5),
              height: sHeight * 0.2,
              width: double.maxFinite,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(widget.dp),
                  SizedBox(
                    width: sWidth * 0.1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.designation,
                        style: TextStyle(color: Colors.black38),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Color(0xffE8F3F1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(" " + widget.rating.toString(),
                                style: const TextStyle(color: Colors.black38)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              size: 14,
                              // color: Theme.of(context).primaryColor,
                              color: Colors.black38,
                            ),
                            Text(
                              widget.distance.toString() + " km away",
                              style: const TextStyle(color: Colors.black38),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Text(
              "About",
              style: TextStyle(
                  fontSize: 20,
                  // color: Colors.black54,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: sHeight * 0.01,
            ),
            Text(
              "Dr. ${widget.name} is a highly experienced ${widget.designation} with 10 years of expertise. They prioritize personalized care, stay updated with the latest medical advancements, and actively engage in community health initiatives to empower patients and ensure optimal outcomes.",
              // maxLines: 6,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: sHeight * 0.02,
            ),
            SizedBox(
              // decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              height: sHeight * 0.08,
              // height: 70,
              child: ListView.builder(
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // height: 40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.only(right: 9),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),

                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          consecutiveMonths[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          consecutiveDays[index],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: sHeight * 0.02,
            ),
            Container(
              height: sHeight * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("10:00 AM"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("11:00 AM"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("12:00 PM"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("02:00 PM"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("03:00 PM"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("04:00 PM"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("05:00 PM"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("06:00 PM"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black12)),
                        child: Text("07:00 PM"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: sHeight * 0.02,
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
