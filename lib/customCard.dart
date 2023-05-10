import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final Widget image;
  final VoidCallback onTab;
  final Color color;
  final Color gradient;
  final double height;

  const CustomCard({Key? key, required this.title, required this.image, required this.onTab, required this.color, required this.gradient, required this.height}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      child: GestureDetector(
        onTap: widget.onTab,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Card(
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0)
                  ),
                  gradient : LinearGradient(
                    colors: [widget.color, widget.gradient],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight
                  )
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ListTile(
                      title: Text(widget.title),
                    ),
                  ),
                )
              )
            ),
            Container(child : widget.image)
          ]
        ),
      ),
    );

  }
}