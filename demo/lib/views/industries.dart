
import 'package:demo/models/industry.dart';
import 'package:demo/network/webservices.dart';
import 'package:demo/views/cards/industry_card.dart';
import 'package:demo/widgets/appbar.dart';
import 'package:demo/widgets/drawer.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class IndustriesPage extends StatefulWidget {
  const IndustriesPage({ Key? key }) : super(key: key);

  @override
  _IndustriesPageState createState() => _IndustriesPageState();
}

class _IndustriesPageState extends State<IndustriesPage> {
late List<Industry> industries;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

 fetchData() async {
    var res = await getIndustries(context);
    if (res != null) {
      setState(() {
        industries = res.industries;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("titles.industries".tr(), context),
        drawer: navDrawer(context),
        body: ListView.separated(
            itemBuilder: (BuildContext context, index) {
              return industryItem(context, industries[index]);
            },
            separatorBuilder: (BuildContext context, index) {
              return Divider(
                height: 2.0,
                color: Colors.transparent,
              );
            },
            itemCount: industries.length));
  }
}