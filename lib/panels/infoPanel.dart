import 'package:flutter/material.dart';
import 'package:india_corona/datasource.dart';
import 'package:india_corona/pages/faqs.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InfoPanelContainer(
            title: "FAQ\'s",
            ontap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FAQPage()));
            },
          ),
          InfoPanelContainer(
            title: "DONATE",
            ontap: () {
              launch('https://covid19responsefund.org/en/');
            },
          ),
          InfoPanelContainer(
            title: "MYTH BUSTERS",
            ontap: () {
              launch(
                  'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters');
            },
          ),
        ],
      ),
    );
  }
}

class InfoPanelContainer extends StatelessWidget {
  final String title;
  final Function ontap;
  const InfoPanelContainer({
    Key key,
    @required this.title,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        color: primaryBlack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
