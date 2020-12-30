import 'package:deep_uni_link_flutter/test_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkService {
  // Future<void> retrieveDynamicLink(BuildContext context) async {
  //   try {
  //     final PendingDynamicLinkData data =
  //         await FirebaseDynamicLinks.instance.getInitialLink();
  //     Uri deepLink = data?.link;

  //     if (deepLink != null) {
  //       if (deepLink.queryParameters.containsKey('id')) {
  //         String id = deepLink.queryParameters['id'];
  //         Navigator.of(context).push(
  //           MaterialPageRoute(
  //             builder: (context) => TestScreenPage(
  //               id: id,
  //             ),
  //           ),
  //         );
  //       }
  //     }

  //     FirebaseDynamicLinks.instance.onLink(
  //         onSuccess: (PendingDynamicLinkData dynamicLink) async {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) => TestScreenPage(),
  //         ),
  //       );
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri deepLink = data?.link;

      if (deepLink != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TestScreenPage()));
      }

      FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData dynamicLink) async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => TestScreenPage()));
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Uri> createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://raka.page.link/',
      link: Uri.parse('https://raka.page.link.com/'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.deep_uni_link_flutter',
        minimumVersion: 1,
      ),
      iosParameters: IosParameters(
        bundleId: '',
        minimumVersion: '1',
        appStoreId: '',
      ),
    );
    var dynamicUrl = await parameters.buildUrl();

    return dynamicUrl;
  }
}
