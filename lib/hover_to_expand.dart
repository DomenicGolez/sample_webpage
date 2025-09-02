import 'package:flutter/material.dart';
import 'package:sample_website/model.dart';

class HoverToExpand extends StatefulWidget {
  const HoverToExpand({super.key});

  @override
  State<HoverToExpand> createState() => _HoverToExpandState();
}

class _HoverToExpandState extends State<HoverToExpand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 900,
          width: 400,
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
    );
  }
}

class HoverItems extends StatefulWidget {
  final ObjectToHover data;
  const HoverItems({super.key, required this.data});

  @override
  State<HoverItems> createState() => _HoverItemsState();
}

class _HoverItemsState extends State<HoverItems> {
  bool isAnimate = false;
  bool textAppear = false;

  void change(bool a) {
    setState(() {
      if (a) {
        textAppear = true;
      } else {
        textAppear = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = isAnimate ? 320 : 275;
    double width = isAnimate ? 530 : 280;
    Color color = isAnimate ? widget.data.color2 : widget.data.color1;
    BorderRadius borderRadius =
        isAnimate ? BorderRadius.circular(40) : BorderRadius.circular(20);
    return MouseRegion(
      onEnter: (event) {
        isAnimate = true;
        change(isAnimate);
      },
      onExit: (event) {
        setState(() {
          isAnimate = false;
          change(isAnimate);
        });
      },
      child: Stack(
          alignment: const Alignment(0, 0),
          children: [
            Align(
              alignment: const Alignment(0, 0),
              child: AnimatedOpacity(
                opacity: isAnimate ? 0.95 : 0.7,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: AnimatedContainer(
                    height: height,
                    width: width,
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: borderRadius,
                    ),
                    child: AnimatedOpacity(
                      opacity: textAppear ? 1 : 0,
                      duration: Duration(milliseconds: textAppear ? 300 : 100),
                      curve: Curves.easeIn,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.title,
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: 270,
                              child: Text(
                                widget.data.description,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0),
              child: AnimatedContainer(
                padding: EdgeInsets.only(left: isAnimate ? 370 : 0),
                duration: const Duration(milliseconds: 200),
                height: height,
                child: AnimatedOpacity(
                  opacity: isAnimate ? 1 : 0.9,
                  duration: const Duration(milliseconds: 200),
                  child: Image(
                    image: AssetImage(widget.data.image),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
