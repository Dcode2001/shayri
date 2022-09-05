import 'package:flutter/material.dart';
import 'package:shayri/thirdpage.dart';

import 'model.dart';

class secondpage extends StatefulWidget {
  int index;

  secondpage(this.index);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  List<String> shayriList = [];

  @override
  void initState() {
    super.initState();

    if (widget.index == 0) {
      shayriList = Model().Trust;
    } else if (widget.index == 1) {
      shayriList = Model().Dosti;
    } else if (widget.index == 2) {
      shayriList = Model().Majedar;
    } else if (widget.index == 3) {
      shayriList = Model().Bhagvan;
    } else if (widget.index == 4) {
      shayriList = Model().Funny;
    } else if (widget.index == 5) {
      shayriList = Model().Jivan;
    } else if (widget.index == 6) {
      shayriList = Model().Motivation;
    } else if (widget.index == 7) {
      shayriList = Model().Attitude;
    } else if (widget.index == 8) {
      shayriList = Model().Birthday;
    } else if (widget.index == 9) {
      shayriList = Model().Alone;
    } else if (widget.index == 10) {
      shayriList = Model().Love;
    } else if (widget.index == 11) {
      shayriList = Model().Happy;
    } else if (widget.index == 12) {
      shayriList = Model().Royal;
    } else if (widget.index == 13) {
      shayriList = Model().Freindship;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Model().names[widget.index]),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            color: Colors.deepPurpleAccent[100],
            shadowColor: Colors.purple,
            margin: EdgeInsets.all(7),
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return thirdpage(shayriList, index);
                  },
                ));
              },
              leading: Image(
                image: AssetImage(Model().images[widget.index]),
                height: 50,
                width: 50,
                fit: BoxFit.fill,
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                    return thirdpage(shayriList, index);
                  },
                  ));
                },
                icon: Icon(Icons.arrow_forward_ios,color: Colors.black),
              ),
              title: Text(
                shayriList[index],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
        itemCount: shayriList.length,
      ),
    );
  }
}
