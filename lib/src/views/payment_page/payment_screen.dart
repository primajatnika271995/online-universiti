import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_university/src/models/courseDetailsModel.dart';
import 'package:online_university/src/utils/appTheme.dart';
import 'package:online_university/src/views/component/currencyFormatted.dart';

class PaymentScreen extends StatefulWidget {
  final Function callback;
  final CourseDetailsModel value;
  PaymentScreen({Key key, this.callback, this.value}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            appBar(),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppTheme.dark_grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                          child: Column(
                            children: <Widget>[
                              paymentDetails(),
                              SizedBox(
                                height: 20,
                              ),
                              costSummary(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: paymentBtn(),
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

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 2),
              blurRadius: 8.0),
        ],
      ),
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.black,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              "Checkout",
              style: TextStyle(
                color: AppTheme.nearlyWhite,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.black,
                child: InkWell(
                  borderRadius:
                      new BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    Icons.payment,
                    size: 25,
                    color: AppTheme.nearlyWhite,
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100,
          width: 100,
          color: Colors.white,
          child: Image.network(widget.value.bannerCourseUrl, fit: BoxFit.cover),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.value.courseTitle, style: AppTheme.title),
                  Text(
                    "by ${widget.value.mentorName}",
                    style: AppTheme.subtitle,
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(formattedCoursePrice(widget.value.coursePrice),
                style: AppTheme.profileSetting),
          ],
        ),
      ],
    );
  }

  Widget costSummary() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 35),
          child: Text("COST SUMMARY", style: AppTheme.profileSetting),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("SubTotal", style: AppTheme.subtitle),
                    Text(formattedCoursePrice(widget.value.coursePrice),
                        style: AppTheme.caption),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Shipping", style: AppTheme.subtitle),
                    Text("IDR 0", style: AppTheme.caption),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Estimation Tax", style: AppTheme.subtitle),
                    Text("IDR 0", style: AppTheme.caption),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total", style: AppTheme.subtitle),
                    Text(formattedCoursePrice(widget.value.coursePrice),
                        style: AppTheme.caption),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget paymentBtn() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () {},
        color: AppTheme.blue_stone,
        child: Text("CHECK OUT", style: AppTheme.title),
      ),
    );
  }
}
