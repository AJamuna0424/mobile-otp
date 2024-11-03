import 'package:flutter/material.dart';
import 'package:liveasy/Screens/mobilenumber_001.dart';

class FrameScreen extends StatefulWidget {
  const FrameScreen({super.key});

  @override
  State<FrameScreen> createState() => _FrameScreenState();
}

class _FrameScreenState extends State<FrameScreen> {
  String selectLanguage = 'English';

  // List of items in our dropdown menu
  var selectLanguageItem = [
    'English',
    'தமிழ்',
    'हिन्दी',
    'മലയാളം',
    'తెలుగు',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/curve-blue.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0.2,
                child: Image.asset(
                  'assets/images/curve-black.png',
                  fit: BoxFit.cover,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/square.png',
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            child: Image.asset(
                              'assets/images/circle.png',
                              height: MediaQuery.of(context).size.height * 0.03,
                              //fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              //right: 64,
                              bottom: 0.2,
                              child: Image.asset(
                                'assets/images/line.png',
                                fit: BoxFit.cover,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      const Text(
                        'Please select your Language',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      const Text(
                        'You can change the language \n at any time',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          //borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                              color: Colors.grey,
                              style: BorderStyle.solid,
                              width: 0.80),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              underline: Container(),
                              alignment: Alignment.bottomCenter,
                              elevation: 0,
                              borderRadius: BorderRadius.circular(5),
                              value: selectLanguage,
                              items: selectLanguageItem.map((String items) {
                                return DropdownMenuItem(
                                    value: items, child: Text(items));
                              }).toList(),
                              onChanged: (String? newItems) {
                                setState(() {
                                  selectLanguage = newItems!;
                                });
                              }),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MobilenumberScreen()),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.7,
                          color: const Color(0xFF2E3B62),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'NEXT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
