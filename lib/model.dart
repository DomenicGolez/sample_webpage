import 'package:flutter/material.dart';

class ObjectToHover {
  String title;
  String description;
  String image;
  Color color1;
  Color color2;

  ObjectToHover({
    required this.description,
    required this.image,
    required this.title,
    required this.color1,
    required this.color2,
  });
}

List<ObjectToHover> dataInfo = [
  ObjectToHover(
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    image: "images/calls.png",
    title: "Calls",
    color2: const Color(0xff004b93),
    color1: Colors.red[700]!,
  ),
  ObjectToHover(
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
    image: "images/email.png",
    title: "Emails",
    color1: Colors.black,
    color2: Colors.red,
  ),
  ObjectToHover(
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      image: "images/spreadsheet.png",
      title: "Spreadsheets",
      color1: Colors.purple,
      color2: Colors.green),
  // ObjectToHover(
  //     description:
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
  //     image: "images/sprite.png",
  //     title: "Sprite",
  //     color1: Colors.blue,
  //     color2: Colors.orangeAccent),
];
