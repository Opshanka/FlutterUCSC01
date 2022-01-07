import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:demo/common/globals.dart' as global;
Container industryItem(BuildContext context, industry) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    height: height / 6,
    margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
    child: Card(
      child: GestureDetector(
        onTap: () {
          //Navigate to user profile
        },
        child: Row(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0, left: 15, right: 0),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.jpg',
              image: global.API_BASE + industry.logoUrl,
              width: (width / 3) - 15,
              height: height / 6,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 15, top: 15),
                width: width * 2 / 3 - 55,
                height: (height / 6 - 40) / 2,
                child: Text(
                  industry.name,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15, top: 5),
                height: (height / 6 - 40) / 2,
                width: width * 2 / 3 - 55,
                child: Text(
                  'labels.industry_id'.tr() + (industry.id).toString(),
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ]),
      ),
    ),
    decoration: BoxDecoration(boxShadow: [
       BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 5.0,
      ),
    ]),
  );
}