import 'dart:math';
import 'package:clipboard/clipboard.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri/editpage.dart';
import 'package:flutter/material.dart';
import 'package:shayri/model.dart';

class thirdpage extends StatefulWidget {
  int index;
  List<String> l;

  thirdpage(this.l, this.index);

  @override
  State<thirdpage> createState() => _thirdpageState();
}

class _thirdpageState extends State<thirdpage> {
  String listemoji = "🥀 🌺"
      " 🌸 🌼 🌻 🌞 ";

  Gradient randomcolor = LinearGradient(colors: [Colors.blueGrey, Colors.lightGreen],transform: GradientRotation(77));

  PageController pageController = PageController();

  Color bgclrr = Colors.purpleAccent;

  @override
  void initState() {
    super.initState();

    pageController = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shayri")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: () {
                showModalBottomSheet(
                  isDismissible: false,
                  builder: (context) {
                    return Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: GridView.builder(
                                itemCount: Model.randomlist.length,
                                itemBuilder: (context, index) {
                                  return InkWell(onTap: () {
                                      setState(() {
                                        randomcolor = Model.randomlist[index];
                                      });
                                  },
                                    child: Container(
                                      // height: 40,
                                      // width: 40,
                                      decoration: BoxDecoration(gradient: Model.randomlist[index]),
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(10),
                                      child: Text("${listemoji}\nShayri\n${listemoji}",style: TextStyle(fontSize: 21),textAlign: TextAlign.center,),
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
                child: Container(
                  height: 35,
                  width: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 0, bottom: 0, left: 80, right: 0),
                  child: Icon(
                    Icons.zoom_out_map_outlined,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              Container(
                  height: 70,
                  width: 110,
                  // margin: EdgeInsets.symmetric(horizontal: ,vertical: 3),
                  // color: Colors.lightGreen,
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.index + 1} / ${widget.l.length}",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
              InkWell(onTap: () {
                setState(() {
                  randomcolor = LinearGradient(
                      colors: [
                        Colors.primaries[Random().nextInt(Colors.primaries.length)],
                        Colors.primaries[Random().nextInt(Colors.primaries.length)]
                      ],transform: GradientRotation(77));
                });
              },
                child: Container(
                  height: 35,
                  width: 40,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: 0, bottom: 0, left: 0, right: 60),
                  child: Icon(
                    Icons.cached_rounded,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  print(value);
                  setState(() {
                    widget.index = value;
                  });
                },
                itemCount: widget.l.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(gradient: randomcolor),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    alignment: Alignment.center,
                    child: Text(
                      "${listemoji}\n${widget.l[widget.index]}\n${listemoji}",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 23.5,fontWeight: FontWeight.w500),
                    ),
                  );
                },
              )),
          Container(
              height: 70,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              color: Colors.deepPurple[400],
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        if (widget.index > 0) {
                          setState(() {
                            widget.index--;
                            pageController.jumpToPage(widget.index);
                          });
                        }
                        setState(() {});
                      },
                      icon: Icon(Icons.arrow_back_ios_new,size: 28,)),
                  IconButton(
                      onPressed: () {
                        FlutterClipboard.copy("${widget.l[widget.index]}").then(
                                (value) =>
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Copied!!"),
                                  duration: Duration(seconds: 3),
                                )));
                      },
                      icon: Icon(Icons.copy),iconSize: 28,),
                  IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return editpage(widget.index, widget.l);
                          },
                        ));
                      },
                      icon: Icon(Icons.edit),iconSize: 28,),
                  IconButton(
                      onPressed: () {
                        // Share.share('check out my website https://example.com', subject: '${listemoji}\n${widget.l[widget.index]}\n${listemoji}');
                        Share.share('${listemoji}\n${widget.l[widget.index]}\n${listemoji}');
                      },
                      icon: Icon(Icons.share),iconSize: 28,),
                  IconButton(
                      onPressed: () {
                        if (widget.index < widget.l.length - 1) {
                          pageController.jumpToPage(widget.index);
                          widget.index++;
                          setState(() {});
                        }
                      },
                      icon: Icon(Icons.arrow_forward_ios),iconSize: 28,)
                ],
              )),
        ],
      ),
    );
  }
}
