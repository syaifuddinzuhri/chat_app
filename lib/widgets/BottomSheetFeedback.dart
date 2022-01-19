import 'package:flutter/material.dart';

class BottomSheetFeedback {
  const BottomSheetFeedback();

  static Future showError(
      BuildContext context, String title, String description) async {
    double _screenWidth = MediaQuery.of(context).size.width;
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _screenWidth * (15 / 100),
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(7.5 / 2),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 70,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                Container(
                    margin: EdgeInsets.only(top: 1),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                    ))
              ],
            ),
          );
        });
    return;
  }

  static Future showSuccess(
      BuildContext context, String title, String description) async {
    double _screenWidth = MediaQuery.of(context).size.width;
    await showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 15, 45),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _screenWidth * (15 / 100),
                  height: 7,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(7.5 / 2),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 70,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                ),
                Container(
                    margin: EdgeInsets.only(top: 1),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                    ))
              ],
            ),
          );
        });
    return;
  }
}
