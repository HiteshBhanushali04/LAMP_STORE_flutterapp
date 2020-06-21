import 'package:flutter/material.dart';

import 'constants.dart';
import 'data.dart';

class cardview extends StatelessWidget {
  int index;

  cardview(int ind) {
    this.index = ind;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Stack(
              children: <Widget>[
                Container(
                  height: index % 2 == 0 ? 300 : 300,
                  //width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: grey_back,
                    //Image.network("https://images-na.ssl-images-amazon.com/images/I/81wMgwfcP%2BL._SY445_.jpg",fit: BoxFit.fill,),
                  ),
                  child: Center(
                    child: Container(
                        height: index % 2 == 0 ? 250 : 250,
                        width: 100,
                        child: Image.network(
                          image[index],
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
                Positioned(
                  bottom: -2,
                  right: 12,
                  child: Icon(
                    Icons.favorite,
                    color: like,
                  ),
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
          padding: const EdgeInsets.only(right:130),
          child: Text(
            "\$"+price[index].toString(),
            maxLines: 2,
            style: TextStyle(
                fontSize: 17, color: like, fontWeight: FontWeight.bold),
          ),
        )

      ],
    );
  }
}
