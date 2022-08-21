import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        children: [
          Card(
            color: Colors.transparent,
            child: TextButton(
                onPressed: () {},
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
