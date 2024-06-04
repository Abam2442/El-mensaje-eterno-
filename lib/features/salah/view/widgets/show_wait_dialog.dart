
import 'package:flutter/material.dart';
class ShowWaitDialog extends StatelessWidget {
  const ShowWaitDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Colors.transparent,
          ),
          /*SizedBox(width: 10),
          DefaultTextStyle(
              style: AppTheme.waitDialogTextStyle,
              child: Text('.. الرجاء الانتظار'))*/
        ],
      ),
    );
  }
}
