import 'package:beehive/common.dart';
import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final Function(ButtonAction action) onPressed;

  const FooterWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Card(
            color: Colors.transparent,
            child: TextButton(
                onPressed: () => onPressed(ButtonAction.setting),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.settings,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(
                      '设置',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
