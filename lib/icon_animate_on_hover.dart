import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample_website/highlight_on_hover.dart';
import 'package:sample_website/hover_to_expand.dart';
import 'package:sample_website/model.dart';

class BeautifulSocialIcon extends StatefulWidget {
  const BeautifulSocialIcon({super.key});

  @override
  State<BeautifulSocialIcon> createState() => _BeautifulSocialIconState();
}

class _BeautifulSocialIconState extends State<BeautifulSocialIcon> {
  bool isAnimate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Company Corporation, Inc.'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "images/background.png"), // Replace with your image path
              fit: BoxFit.cover, // Options: cover, contain, fill, etc.
            ),
          ),
          child: Column(
            children: [
              MouseRegion(
                onEnter: (event) {
                  setState(() {
                    isAnimate = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    isAnimate = false;
                  });
                },
                child: Padding(
                  padding: isAnimate
                      ? const EdgeInsets.only(left: 0)
                      : const EdgeInsets.only(left: 150),
                  child: SizedBox(
                    height: 400,
                    // width: isAnimate ? 530*3 : 280*4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataInfo.length,
                      itemBuilder: (context, index) {
                        final data = dataInfo[index];
                        return HoverItems(data: data);
                      },
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  // 1st column
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 10, bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey.withOpacity(0.7),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blueAccent,
                                ),
                                child: const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Company Corporation',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            textAlign: TextAlign.left,
                            "Lorem ipsum dolor sit amet consectetur adipiscing elit.\nQuisque faucibus ex sapien vitae pellentesque sem placerat.\nIn id cursus mi pretium tellus duis convallis.\nTempus leo eu aenean sed diam urna tempor.\nPulvinar vivamus fringilla lacus nec metus bibendum egestas.\nIaculis massa nisl malesuada lacinia integer nunc posuere.\nUt hendrerit semper vel class aptent taciti sociosqu.\nAd litora torquent per conubia nostra inceptos himenaeos.",
                            style: TextStyle(
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                        ),
                        const Row(
                          children: [
                            SocialIcon(
                              icon: FontAwesomeIcons.instagram,
                              color: Color(0xffe1306c),
                              text: "Instagram",
                            ),
                            SocialIcon(
                              icon: FontAwesomeIcons.facebook,
                              color: Color(0xFF1877F2),
                              text: "Facebook",
                            ),
                            SocialIcon(
                              icon: FontAwesomeIcons.youtube,
                              color: Color(0xFFFF0000),
                              text: "YouTube",
                            ),
                            SocialIcon(
                              icon: FontAwesomeIcons.linkedin,
                              color: Color(0xff0e76a8),
                              text: "LinkedIn",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // 2nd column
                  Container(
                    margin: const EdgeInsets.only(left: 50, bottom: 140),
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey.withOpacity(0.7),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          // height: 130,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text("Contact Us",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: 300,
                            height: 120,
                            child: const Column(
                              children: [
                                ForHover(text: "Phone: \n+639876543210"),
                                ForHover(
                                    text:
                                        "Email: inquire@companycorporation.com"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String text;
  const SocialIcon({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(right: 2),
      // height: 105,
      width: 85,
      child: Stack(
        children: [
          AnimatedOpacity(
            opacity: isHover ? 1 : 0, // opacity on hover icon text
            duration: const Duration(
                milliseconds: 100), // time take to remove icon name
            child: AnimatedAlign(
              alignment:
                  isHover ? const Alignment(0, -1) : const Alignment(0, 0),
              duration: const Duration(milliseconds: 200),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Positioned(
                  //   left: 40,
                  //   top: 30,
                  //   child: Transform(
                  //     transform: Matrix4.rotationZ(pi / 4),
                  //     alignment: FractionalOffset.center,
                  //     child: Container(
                  //       height: 20,
                  //       width: 10,
                  //       color: widget.color,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   height: 35,
                  //   width: 100,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: widget.color,
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       widget.text,
                  //       style: const TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHover = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHover = false;
                });
              },
              child: AnimatedContainer(
                height: 60,
                width: 60,
                duration: const Duration(microseconds: 350),
                decoration: BoxDecoration(
                  color: isHover ? widget.color : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  widget.icon,
                  size: 30,
                  color: isHover ? Colors.white : widget.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
