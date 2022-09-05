import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';

import 'model.dart';

class editpage extends StatefulWidget {
  int index;
  List<String> l;

  editpage(this.index, this.l);

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {

  Gradient randomcolor = LinearGradient(
      colors: [Colors.indigo, Colors.red, Colors.purple],
      transform: GradientRotation(10));

  List<String> fonts = [
    "family1",
    "family2",
    "family3",
    "family4",
    "family5",
    "family6",
    "family7",
    "family8",
    "family9",
    "family10",
    "family11",
    "family12",
    "family13"
  ];
  String fontfam = "";
  List<Color> clr = [
    Colors.red.shade100,
    Colors.yellow.shade300,
    Colors.blue.shade200,
    Colors.tealAccent.shade100,
    Colors.black,
    Colors.lightBlue.shade300,
    Colors.redAccent.shade100,
    Colors.tealAccent.shade700,
    Colors.teal.shade200,
    Colors.lightGreen.shade400,
    Colors.yellowAccent.shade200,
    Colors.green.shade500,
    Colors.deepPurple.shade100,
    Colors.indigo.shade200,
    Colors.amber.shade200,
    Colors.lime,
    Colors.purpleAccent,
    Colors.blueGrey.shade400,
    Colors.pinkAccent.shade100,
    Colors.purpleAccent.shade100,
    Colors.orange.shade300,
    Colors.amberAccent,
    Colors.lightGreenAccent.shade200,
    Colors.lightBlue.shade200
  ];

  List<Color> textclr = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.tealAccent,
    Colors.black,
    Colors.lightBlue,
    Colors.redAccent,
    Colors.tealAccent,
    Colors.teal,
    Colors.lightGreen,
    Colors.yellowAccent,
    Colors.green,
    Colors.deepPurple,
    Colors.indigo,
    Colors.amber,
    Colors.lime,
    Colors.purpleAccent,
    Colors.blueGrey,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.orange,
    Colors.amberAccent,
    Colors.black54,
    Colors.lightBlue
  ];

  Color bgcolor = Colors.grey;
  Color textcolor = Colors.black;
  TextAlign textformat = TextAlign.center;
  String listemoji = "🥀 🌺 🌸 🌼 🌻 🌞 ";

  List<String> emoji = [
    "😀 😃 😄 😁 😆",
    "❤️ 🧡 💛 💚 💙 💜",
    "💐 🌷 🌹 🥀 🌺",
    "🌸 🌼 🌻 🌞 🌝",
    "💫 ⭐️ 🌟 ✨ ⚡",
    "👑 👒 🎩 🎓 🧢",
    " 💗 💖 💘 💝 💟 ",
    "🐹 🐰 🦊 🐻 🐼 🐻‍❄",
    " 🌺 🌸 🌼 🌻 🌞 🌝 ",
    "♠️ ♣️ ♥️ ♦️ 🃏",
    "🌸 🌼 🌻 🌞 🌝",
    "🌈 ☀️ 🌤 ⛅️ 🌥",
    "🌿 ☘️ 🍀 🎍 🪴 🎋 🍃",
    "🪐 💫 ⭐️ 🌟 ✨ ",
    "💥 🔥 🌪 🌈 ☀️ 🌤 ⛅",
    "🍭 🍬 🍫 🍿 🍩 🍪",
    "♡ ♢ ♚ ♛ ♜ ♝ ♞"
  ];

  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    createfolder();
  }

  String folderpath = "";

  createfolder() async {
    String path = "storage/emulated/0/Download/Shayri 2022";

    Directory directory = Directory(path);
    bool status = await directory.exists();
    if (status) {
      print("Already Exits");
    } else {
      await directory.create();
      print("Created");
    }

    folderpath = directory.path;
  }

  double textsize = 23.5;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("EDIT SHAYRI...")),
        body: Column(
          children: [
            Expanded(
              child: Container(
                // height: double.infinity,
                // width: double.infinity,
                // color: Colors.grey[400],
                decoration: BoxDecoration(gradient: randomcolor),
                alignment: Alignment.center,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    RepaintBoundary(
                      key: _globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // color: bgcolor,
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(gradient: randomcolor),
                          alignment: Alignment.center,
                          child: Text(
                            "${listemoji}\n${widget.l[widget.index]}\n${listemoji}",
                            textAlign: textformat,
                            style: TextStyle(
                                fontSize: textsize,
                                fontWeight: FontWeight.w500,
                                color: textcolor,
                                fontFamily: fontfam),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                        ),
                      ),
                    )
                  ],
                ),
                // margin: EdgeInsets.all(10),
              ),
            ),
            Container(
              height: 175,
              width: double.infinity,
              margin: EdgeInsets.all(7),
              alignment: Alignment.center,
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              textformat = TextAlign.left;
                            });
                          },
                          icon: Icon(Icons.format_align_left),
                          iconSize: 35,
                          color: Colors.white),
                      IconButton(
                          onPressed: () {
                            return setState(() {
                              textformat = TextAlign.center;
                            });
                            // });
                          },
                          icon: Icon(Icons.format_align_center_outlined),
                          iconSize: 35,
                          color: Colors.white),
                      IconButton(
                        onPressed: () {
                              setState(() {
                                randomcolor = LinearGradient(
                                    colors: [
                                      Colors.primaries[Random().nextInt(Colors.primaries.length)],
                                      Colors.primaries[Random().nextInt(Colors.primaries.length)]
                                    ],transform: GradientRotation(60));
                              });
                        },
                        icon: Icon(Icons.autorenew_rounded),
                        iconSize: 35,
                        color: Colors.white,
                      ),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isDismissible: false,
                              builder: (context) {
                                return Container(
                                  height: 300,
                                  width: 70,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GridView.builder(
                                        itemCount: Model.randomlist.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                randomcolor = Model.randomlist[index];
                                              });
                                            },
                                            child: Container(
                                              // height: 40,
                                              // width: 40,
                                              decoration: BoxDecoration(gradient: Model.randomlist[index],),
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.all(10),
                                              child: Text(
                                                "🌸 🌼 🌻 🌞 🌝\nShayri\n🌸 🌼 🌻 🌞 🌝",
                                                style:
                                                    TextStyle(fontSize: 23.5),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          );
                                        },
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 1),
                                      )),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                          ))
                                    ],
                                  ),
                                );
                              },
                              context: context,
                            );
                          },
                          icon: Icon(Icons.zoom_out_map),
                          iconSize: 35,
                          color: Colors.white),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              textformat = TextAlign.justify;
                            });
                          },
                          icon: Icon(Icons.format_align_justify),
                          iconSize: 35,
                          color: Colors.white),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              textformat = TextAlign.right;
                            });
                          },
                          icon: Icon(Icons.format_align_right_outlined),
                          iconSize: 35,
                          color: Colors.white),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                isDismissible: false,
                                barrierColor: Colors.transparent,
                                backgroundColor: Colors.white,
                                builder: (context) {
                                  return Container(
                                    height: 180,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: GridView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: clr.length,
                                          itemBuilder: (context, index) {
                                            return GridTile(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {

                                                     randomcolor = LinearGradient(
                                                        colors: [clr[index],clr[index]],
                                                        );

                                                  });
                                                },
                                                child: Expanded(
                                                  child: Container(
                                                    color: clr[index],
                                                    margin: EdgeInsets.all(5),
                                                  ),
                                                ),
                                              ),
                                              header: Container(
                                                  height: 3,
                                                  margin: EdgeInsets.all(5),
                                                  color: Colors.black),
                                              footer: Container(
                                                  height: 3,
                                                  margin: EdgeInsets.all(5),
                                                  color: Colors.black),
                                            );
                                          },
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 8,
                                            childAspectRatio: 1,
                                            mainAxisSpacing: 20,
                                            // crossAxisSpacing: 10
                                          ),
                                        )),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.close),
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  );
                                },
                                context: context);
                          },
                          child: Expanded(
                            child: Container(
                                height: 40,
                                width: double.infinity,
                                color: Colors.grey[400],
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  "Background",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                )),
                          ),
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isDismissible: false,
                                    barrierColor: Colors.transparent,
                                    backgroundColor: Colors.white,
                                    builder: (context) {
                                      return Container(
                                        height: 180,
                                        child: Row(
                                          // crossAxisAlignment:
                                          //     CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: GridView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount: clr.length,
                                              itemBuilder: (context, index) {
                                                return GridTile(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        textcolor = textclr[index];
                                                      });
                                                    },
                                                    child: Container(
                                                      color: textclr[index],
                                                      margin: EdgeInsets.all(5),
                                                    ),
                                                  ),
                                                  header: Container(
                                                      height: 3,
                                                      margin: EdgeInsets.all(5),
                                                      color: Colors.black),
                                                  footer: Container(
                                                      height: 3,
                                                      margin: EdgeInsets.all(5),
                                                      color: Colors.black),
                                                );
                                              },
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 8,
                                                childAspectRatio: 1,
                                                mainAxisSpacing: 20,
                                                // crossAxisSpacing: 10
                                              ),
                                            )),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                    context: context);
                              },
                              child: Expanded(
                                child: Container(
                                    height: 40,
                                    width: 50,
                                    color: Colors.grey[400],
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "Text Color",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )),
                              ),
                            ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                _capturePng().then((value) async {
                                  print(value);
                                  DateTime dt = DateTime.now();

                                  String time =
                                      "${dt.year}${dt.month}${dt.day}${dt.hour}${dt.minute}${dt.second}";

                                  String imagepath =
                                      "${folderpath}/Shayri$time.jpg";
                                  File file = File(imagepath);
                                  await file.create();

                                  file.writeAsBytesSync(value);

                                  String path = file.path;

                                  Share.shareFiles([path],
                                      text: 'Great picture');
                                });
                              },
                              child: Container(
                                  height: 40,
                                  width: 50,
                                  color: Colors.grey[400],
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Share",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )),
                            ))
                          ],
                        ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isDismissible: false,
                              builder: (context) {
                                return Container(
                                  height: 178,
                                  width: 70,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: GridView.builder(
                                        itemCount: 13,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                fontfam = fonts[index];
                                              });
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 40,
                                              color: Colors.deepPurple[200],
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(
                                                  top: 10,
                                                  bottom: 10,
                                                  left: 90,
                                                  right: 80),
                                              child: Text(
                                                "SHAYARI",
                                                style: TextStyle(
                                                    fontFamily: fonts[index]),
                                              ),
                                            ),
                                          );
                                        },
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                childAspectRatio: 5),
                                      )),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                          ))
                                    ],
                                  ),
                                );
                              },
                              context: context,
                            );
                          },
                          child: Expanded(
                            child: Container(
                                height: 40,
                                width: 50,
                                color: Colors.grey[400],
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  "Font",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                )),
                          ),
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isDismissible: false,
                                    barrierColor: Colors.transparent,
                                    builder: (context) {
                                      return Container(
                                        // margin: EdgeInsets.all(10),
                                        height: 175,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                                child: GridView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount: emoji.length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      listemoji = emoji[index];
                                                    });
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 33,
                                                    child: Text(
                                                      emoji[index],
                                                      style: TextStyle(
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                );
                                              },
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1,
                                                childAspectRatio: 8,
                                              ),
                                            )),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Colors.black,
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                    context: context);
                              },
                              child: Expanded(
                                child: Container(
                                    height: 40,
                                    width: 50,
                                    color: Colors.grey[400],
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "Emoji",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    )),
                              ),
                            ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: 170,
                                      margin: EdgeInsets.all(10),
                                      // color: Colors.transparent,
                                      child: StatefulBuilder(
                                        builder: (context, setState1) {
                                          return Slider(
                                            min: 10,
                                            max: 80,
                                            onChanged: (value) {
                                              print(value);

                                              setState(() {});
                                              setState1(() {
                                                textsize = value;
                                              });
                                            },
                                            value: textsize,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.grey[400],
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Text Size",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )),
                            ))
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      return pngBytes;
    } catch (e) {
      print(e);
      return Future.value();
    }
  }
}

