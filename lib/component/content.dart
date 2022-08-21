import 'package:beehive/app_manager.dart';
import 'package:flutter/material.dart';

import '../clipboard.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  @override
  void initState() {
    appMgr.clipboard.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clipboardList = appMgr.clipboard.bindWidget<ClipboardProvider>((context, provider, child) {
      return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0.5,
            color: Colors.white12,
          );
        },
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () => appMgr.clipboard.select(index),
            child: Container(
              alignment: Alignment.centerLeft,
              height: 48,
              child: Row(
                children: [
                  const Icon(
                    Icons.text_snippet,
                    color: Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      provider.strings[index],
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: provider.strings.length,
      );
    });
    // final strings = appMgr.clipboard.strings;
    // debugPrint('$strings');
    // final clipboardList = ListView.builder(
    //   itemBuilder: (context, index) {
    //     return Text(strings[index]);
    //   },
    //   itemCount: strings.length,
    // );

    return Expanded(
      child: clipboardList,
    );
  }
}
