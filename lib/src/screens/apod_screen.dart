import 'package:apod_app_a1/src/models/apod_model.dart';
import 'package:apod_app_a1/src/providers/apod_provider.dart';
import 'package:apod_app_a1/src/views/card_widget.dart';
import 'package:flutter/cupertino.dart';

class ApodScreen extends StatefulWidget {
  ApodScreen({Key key}) : super(key: key);

  @override
  _ApodScreenState createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  int _selectedIndex = 0;
  List<Widget> _childrens = List();

  final _apodProvider = ApodProvider();

  @override
  void initState() {
    super.initState();
    _childrens.add(_apodRecentList());
    _childrens.add(Text('Contenido Random'));
    _childrens.add(Text('Contenido Saved'));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Julio 25, 2020'),
            Row(
              children: <Widget>[
                Expanded(child: Text('APOD')), // alinear en horizontal
                CupertinoButton(
                    child: Icon(CupertinoIcons.refresh_thick),
                    onPressed: () => print('Refresh'))
              ],
            ),
            Container(
              height: 1.0,
              color: CupertinoColors.systemGrey5,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: CupertinoSlidingSegmentedControl<int>(
                children: {
                  0: Text('Recent'),
                  1: Text('Random'),
                  2: Text('Saved')
                },
                onValueChanged: _onValuechanged,
                groupValue: _selectedIndex,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(child: _childrens[_selectedIndex]),
          ],
        ),
      ),
    ));
  }

  void _onValuechanged(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget _apodRecentList() {
    return FutureBuilder(
        //para construir en base a una sentencia future
        future: _apodProvider.getRecentImages(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ApodImage>> snapshot) {
          if (snapshot.hasData) {
            // al cargar los datos los muestra
            return _cardList(snapshot.data);
          } else {
            //si no los carga aun muestra el activity indicator
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        });
  }

  Widget _cardList(List<ApodImage> imageList) {
    //crear lista de cartas
    return ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return CupertinoCard(
              apodImage: imageList[index],
              onPressed: () => print(''),
              icon: CupertinoIcons.heart_solid);
        });
  }
}
