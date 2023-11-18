import 'package:flutter/material.dart';
import 'package:protizen/constant/color.dart';
import 'package:protizen/features/screens/emergency.dart';
import 'package:protizen/main.dart';

//  i want to add three buttons on the home page
// 1. fire, 2, police, 3. ambulance
// when the user clicks on any of the buttons, the app should send the location of the user to the respective service

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add a floating action button for emergency

      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Protizen',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
            const Text(
              'Emergency Services Dispatcher',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              child: Column(
                children: [
                  // list of data we are tracking and sharing on start up Geo Location Heart Monitoring Medical History Camera Respitory Monitoring
                  Text(
                    'Tracked and Shared Data\n',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),

                  Text(
                    'Geo Location',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Heart Monitoring',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Respitory Monitoring',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),

                  Text(
                    'Camera and Audio',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),

                  Text(
                    'Medical History',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20), // Add this SizedBox for space
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.3,
                      // a police button with a police icon
                      child: ElevatedButton(
                        onPressed: () {
                          if (cameras.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(camera: cameras.first),
      ),
    );
  } else {
    print('No cameras available');
    // or show a dialog
  }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: primaryYellow,
                          // text of police button

                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.local_police,
                              color: primaryBlue,
                            ),
                            Text(
                              'Police',
                              style:
                                  TextStyle(color: primaryBlue, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.3,
                      // a police button with a police icon
                      child: ElevatedButton(
                        onPressed: () {
                         if (cameras.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(camera: cameras.first),
      ),
    );
  } else {
    print('No cameras available');
    // or show a dialog
  }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: primaryYellow,
                          // text of police button

                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.fire_truck_rounded,
                              color: primaryBlue,
                            ),
                            Text(
                              'Fire',
                              style:
                                  TextStyle(color: primaryBlue, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.3,
                      // a police button with a police icon
                      child: ElevatedButton(
                        onPressed: () {
                          if (cameras.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(camera: cameras.first),
      ),
    );
  } else {
    print('No cameras available');
    // or show a dialog
  }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: primaryYellow,
                          // text of police button

                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.medical_services,
                              color: primaryBlue,
                            ),
                            Text(
                              'Medical',
                              style:
                                  TextStyle(color: primaryBlue, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],

          // three buttons for fire, police and ambulance in a row.
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: () {
          if (cameras.isNotEmpty) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CameraPage(camera: cameras.first),
      ),
    );
  } else {
    print('No cameras available');
    // or show a dialog
  }
        },
        backgroundColor: primaryYellow,
        label: const Text(
          "  Emergency  ",
          style: TextStyle(
              fontSize: 30, color: primaryBlue, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
