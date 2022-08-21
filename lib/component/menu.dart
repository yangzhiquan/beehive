import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({Key? key}) : super(key: key);

  final menus = <String>['剪切板'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: menus.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.transparent,
            child: TextButton(
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.content_paste,
                      color: Colors.grey,
                      size: 20,
                    ),
                    Text(
                      menus[index],
                      style: const TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
