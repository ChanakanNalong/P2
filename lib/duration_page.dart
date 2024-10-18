import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/round_button.dart';
import 'components/text_input.dart';
import 'bill_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DurationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Energy_Monitoring_System',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          shadows: [
                            Shadow(
                              color: Colors.deepPurple,
                              offset: Offset(2, 2),
                              blurRadius: 6,
                            )
                          ],
                          color: Colors.deepPurple,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SvgPicture.asset(
                        "images/power.svg",
                        color: Color(0xff77A7EF),
                        //Color(0xff281B3A),
                        height: (MediaQuery.of(context).size.height) * 0.09,
                        width: (MediaQuery.of(context).size.width) * 0.09,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextTimeInput('FROM'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextTimeInput('TO'),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 174, 63, 189),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'notification_dialog');
                },
                child: const Text(
                  "Go",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
              width: 350,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 174, 63, 189),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                child: const Text(
                  "Back",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
