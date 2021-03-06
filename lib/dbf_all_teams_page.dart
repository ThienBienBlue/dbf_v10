import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const EdgeInsetsGeometry padding = EdgeInsets.all(12.0);
    
/**
 * Page with all the DBF teams as cards in a GridView. Clicking on a card will
 * pull up the appropriate Team's info page.
 */
class DbfAllTeamsPage extends StatelessWidget
{
    static const List<String> _teams = [
        'Propulsions',
        'Manufacturing',
        'CAD',
        'Aerodynamics',
        'Structures'
    ];
    static final List<Color> _colors = [
        Colors.deepPurpleAccent,
        Colors.orange,
        Colors.cyan,
        Colors.blueGrey,
        Colors.teal,
        Colors.amber,
        Colors.blueAccent,
        Colors.deepOrange,
    ];
    
    final void Function(int) _change_page;

    DbfAllTeamsPage(void Function(int) change_page, {Key key})
        : _change_page = change_page,
          super(key: key)
    {
        _colors.shuffle();
    }

    GridTile
    _make_bio_card(BuildContext context, int idx, String team, Color color)
    {
        return GridTile(
            child: Card(
                child: FlatButton(
                    child: Text(
                        team,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'bold',
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                    onPressed: () => _change_page(idx)
                ),
                color: color,
                margin: padding,
            ),
        );
    }

    @override Widget
    build(BuildContext context)
    {
        List<GridTile> bios = [];
        for (int idx = 0; idx < _teams.length; idx++)
            bios.add(_make_bio_card(context, idx, _teams[idx], _colors[idx]));

        const double aspect_ratio = 16/9;

        return Stack(
            children: <Widget> [
                Image(
                    image: const AssetImage(
                        './assets/images/teamsbackground.jpg'
                    ),
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: double.infinity
                ),
                Container(
                    color: Color.fromRGBO(0, 0, 0, 0.5)
                ),
                CupertinoScrollbar(
                    child: GridView.extent(
                        maxCrossAxisExtent: 500.0,
                        children: bios,
                        childAspectRatio: aspect_ratio,
                        padding: padding,
                    ),
                )
            ]
        );
    }
}
