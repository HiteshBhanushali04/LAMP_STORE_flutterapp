import 'package:flutter/material.dart';

import 'constants.dart';
import 'data.dart';

class morecard extends StatelessWidget {
  int index;

  morecard(int ind) {
    this.index = ind;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100, //MediaQuery.of(context).size.height*.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: Colors.white,
        //Image.network("https://images-na.ssl-images-amazon.com/images/I/81wMgwfcP%2BL._SY445_.jpg",fit: BoxFit.fill,),
      ),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                        height: 140,
                        width: 140,
                        child: Image.network(
                          image[index],
                          fit: BoxFit.fill,
                        )),
                  ),

                ],
              ),
            ),
          ),
          //SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(right: 50,left: 10),
            child: Text(
              name[index],
              maxLines: 2,
              style: TextStyle(
                  fontSize: 15, color: primary_dark, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:60),
            child: Row(
              children: <Widget>[
                Text(
                  "\$"+price[index].toString(),
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 17, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10,),
                Text(
                  "\$"+pricenew[index].toString(),
                  maxLines: 2,
                  style: TextStyle(decoration: TextDecoration.lineThrough,
                      fontSize: 13, color: like, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
