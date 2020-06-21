import 'package:flutter/material.dart';

import 'cartview.dart';
import 'constants.dart';
import 'data.dart';
import 'detailpage.dart';

class homepage extends StatelessWidget {
  List<String> menu = [
    "All",
    "Popular",
    "Trending",
    "Best Seller",
    "Similar",
    "Liked"
  ];

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey_back,
                      ),
                      child: Center(
                          child: IconButton(
                              icon: Image.asset("assets/menu_icon.png"),
                              onPressed: () {})),
                    ),
                    Text(
                      "EXPLORE",
                      style: TextStyle(
                          fontFamily: "Arial",
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: grey_back,
                      ),
                      //child: Center(child:IconButton(icon: Image.asset("assets/menu_icon.png"), onPressed: (){})),
                      child: GestureDetector(
                          child: Icon(
                        Icons.search,
                        color: Colors.grey[700],
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menu.length,
                    itemBuilder: (context, index) {
                      return menulist(value: menu[index], index: index);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: GridView.builder(
                    itemCount: image.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //crossAxisCount: _crossAxisCount,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.5,
                        crossAxisCount:
                            (orientation == Orientation.portrait) ? 2 : 3),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: cardview(index),
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => detailpage(
                                index
                              )));
                        },
                      );
                    },
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

class menulist extends StatefulWidget {
  final String value;
  final int index;

  const menulist({Key key, this.value, this.index}) : super(key: key);

  @override
  _menulistState createState() => _menulistState();
}

class _menulistState extends State<menulist> {
  //bool click = index;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8),
        child: Text(
          widget.value,
          style: TextStyle(
              color: widget.index==1?primary_dark:grey_back, fontSize: 20),
        ),
      ),
      onPressed: () {
        setState(() {
          //click;
        });
      },
    );
  }
}
