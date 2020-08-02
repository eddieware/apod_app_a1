import 'package:apod_app_a1/src/models/apod_model.dart';
import 'package:flutter/cupertino.dart';

class CupertinoCard extends StatelessWidget {
  const CupertinoCard(
      {Key key, @required this.apodImage, @required this.icon, this.onPressed})
      : super(key: key);
  final ApodImage apodImage;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final _card = Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        FadeInImage(
          height: 300,
          placeholder: AssetImage('assets/cupertino_activity_indicator.gif'),
          image: NetworkImage(apodImage.url),
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 200),
        ),
        Opacity(
          opacity: .6,
          child: Container(
            height: 80.0,
            width: double.infinity,
            color: CupertinoColors.black,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '2020-07-04',
                  style: TextStyle(color: CupertinoColors.white),
                ),
                Text(
                  'Los Azufres Michoacán',
                  style:
                      TextStyle(color: CupertinoColors.white, fontSize: 25.0),
                )
              ],
            ),
          ),
        )
      ],
    );

    return Container(
      //height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        //color: CupertinoColors.activeBlue,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: CupertinoColors.darkBackgroundGray.withOpacity(.7),
              offset: Offset(0.0, 5.0),
              blurRadius: 8.0)
        ],
      ),
      child: ClipRRect(borderRadius: BorderRadius.circular(10.0), child: _card),
    );
  }
}

Widget _cardTipo3(BuildContext contex) {
  final _card = Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      FadeInImage(
        height: 300,
        placeholder: AssetImage('assets/cupertino_activity_indicator.gif'),
        image:
            NetworkImage('https://jooinn.com/images/perfect-landscape-1.jpg'),
        fit: BoxFit.cover,
        fadeInDuration: Duration(milliseconds: 200),
      ),
      Opacity(
        opacity: .6,
        child: Container(
          height: 80.0,
          width: double.infinity,
          color: CupertinoColors.black,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '2020-07-04',
                style: TextStyle(color: CupertinoColors.white),
              ),
              Text(
                'Los Azufres Michoacán',
                style: TextStyle(color: CupertinoColors.white, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
      Positioned(
          top: 5,
          right: 5,
          child: CupertinoButton(
              //child: Icon(icon),
              onPressed: null))
    ],
  );

  return Container(
    //height: 100.0,
    margin: EdgeInsets.all(20.0),
    decoration: BoxDecoration(
      //color: CupertinoColors.activeBlue,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
            color: CupertinoColors.darkBackgroundGray.withOpacity(.7),
            offset: Offset(0.0, 5.0),
            blurRadius: 8.0)
      ],
    ),
    child: ClipRRect(borderRadius: BorderRadius.circular(10.0), child: _card),
  );
}
