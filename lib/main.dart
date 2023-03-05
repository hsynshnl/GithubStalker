import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/user/user_page.dart';

void main() => runApp(
      const GetMaterialApp(
        title: 'Github Stalker',
        debugShowCheckedModeBanner: false,
        home: UserPage(),
      ),
    );
