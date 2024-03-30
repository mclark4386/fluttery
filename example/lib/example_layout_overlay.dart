import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttery_dart2/layout.dart';

class LayoutOverlayExampleScreen extends StatefulWidget {
  @override
  _LayoutOverlayExampleScreenState createState() =>
      new _LayoutOverlayExampleScreenState();
}

class _LayoutOverlayExampleScreenState
    extends State<LayoutOverlayExampleScreen> {
  final fadeDuration = const Duration(milliseconds: 500);

  bool isOverlayDesired = true;
  bool isOverlayVisible = true;

  void showOverlay() {
    setState(() {
      isOverlayDesired = true;
      isOverlayVisible = true;
    });
  }

  void hideOverlay() {
    setState(() => isOverlayDesired = false);

    new Timer(
      fadeDuration,
      () => setState(() => isOverlayVisible = isOverlayDesired),
    );
  }

  Widget buildOverlay(Offset anchor) {
    return new CenterAbout(
      position: anchor,
      child: new Container(
        width: 200.0,
        child: new AnimatedOpacity(
          opacity: isOverlayDesired ? 1.0 : 0.0,
          duration: fadeDuration,
          child: new Card(
            color: Colors.white,
            child: new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Text(
                'This is an overlay!',
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        // Show overlay button.
        new Expanded(
          child: new Center(
            child: ElevatedButton(
              child: Text('Show Overlay'),
              onPressed: showOverlay,
            ),
          ),
        ),

        // Anchored overlay
        new Expanded(
          child: new AnchoredOverlay(
            showOverlay: isOverlayVisible,
            overlayBuilder:
                (BuildContext context, Rect anchorBounds, Offset anchor) {
              return buildOverlay(anchor);
            },
            child: new Container(
              width: 50.0,
              height: 50.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: new Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            ),
          ),
        ),

        // Hide overlay button.
        new Expanded(
          child: new Center(
            child: ElevatedButton(
              child: Text('Hide Overlay'),
              onPressed: hideOverlay,
            ),
          ),
        )
      ],
    );
  }
}
