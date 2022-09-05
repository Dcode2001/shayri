import 'package:flutter/material.dart';
import 'package:shayri/secondpage.dart';

import 'model.dart';

class firstpage extends StatefulWidget {
  const firstpage({Key? key}) : super(key: key);

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  int cnt = 0;

  void changgselected(int index)
  {
    setState(() {
      cnt =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shayri",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Model().names.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 7,
            margin: EdgeInsets.all(5),
            color: Colors.deepPurpleAccent[100],
            shadowColor: Colors.purple,
            child: ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return secondpage(index);
                  },
                ));
              },
              title: Text(
                Model().names[index],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                      return secondpage(index);
                    },
                    ));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  )),
              leading: Image(
                  image: AssetImage(Model().images[index]),
                  fit: BoxFit.fill,
                  height: 50,
                  width: 60),
            ),
          );
        },
        // itemCount: names.length,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              child: DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("shayriimages/img_2.png"),
                    fit: BoxFit.contain,
                  )),
                  child: Column(
                    children: [],
                  )),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.folder),
              ),
              title: Text(
                "MyFiles",
                style: TextStyle(fontSize: 17),
              ),
              selected:  cnt == 0,
              onTap: (){
                changgselected(0);
              },
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.star),
              ),
              title: Text(
                "Stared",
                style: TextStyle(fontSize: 17),
              ),
              selected:  cnt == 1,
              onTap: (){
                changgselected(1);
              },
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
              ),
              title: Text(
                "Share",
                style: TextStyle(fontSize: 17),
              ),
              selected:  cnt == 2,
              onTap: (){
                changgselected(2);
              },
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.contact_phone),
              ),
              title: Text(
                "Contact Us",
                style: TextStyle(fontSize: 17),
              ),
              selected:  cnt == 4,
              onTap: (){
                changgselected(4);
              },
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.event_note_sharp),
              ),
              title: Text(
                "Terms of Us",
                style: TextStyle(fontSize: 17),
              ),
              selected:  cnt == 5,
              onTap: (){
                changgselected(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}
