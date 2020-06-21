import 'package:flutter/material.dart';

import 'cartview.dart';
import 'constants.dart';
import 'data.dart';
import 'morecard.dart';

class detailpage extends StatelessWidget {
  int index;

  detailpage(int index1) {
    this.index = index1;
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      //backgroundColor: grey_back,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[


            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey_back,
                    ),
                    child: GestureDetector(
                        child: Icon(Icons.arrow_back_ios) ,
                      onTap: (){
                          Navigator.pop(context);
                      },
                    ),
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "LAMP",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Arial",
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      Text(
                        name[index],
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Arial",
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
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
                      Icons.favorite_border,
                      color: Colors.grey[700],
                    )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height*.32,
                    child: Image.network(image[index],fit: BoxFit.fill,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0,bottom: 8),
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.16,
                        height: 10,
                        child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(right:8.0),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: index==2?primary_dark:grey_back ,
                                ),
                              );//Icon(index==3?Icons.cir:Icons.star_border,color: primary_dark,size: 10,);
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              name[index],
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Arial",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width*0.16,
                                  height: 10,
                                  child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                      itemBuilder: (context,index){
                                        return Icon(index<5?Icons.star:Icons.star_border,color: primary_dark,size: 10,);
                                      }),
                                ),
                                Text("259 Review",style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: "Arial",
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                        Text(
                          "\$"+price[index].toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Arial",
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                color: primary_dark,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Suggest for you", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                          Text("View all", style: TextStyle(color: Colors.white,fontSize: 20),),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height:MediaQuery.of(context).size.height * .3 ,
                      child:  ListView.builder(
                        itemCount: image.length,
                        scrollDirection: Axis.horizontal,

                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              child: morecard(index),
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => detailpage(
                                        index
                                    )));
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
