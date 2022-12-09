import 'dart:convert';

import 'package:api_integration_tutorial/models/activity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<Activity> getActivity() async {
    late Activity activity;
    const url = 'https://www.boredapi.com/api/activity/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode < 300) {
      final jsonResponse = jsonDecode(response.body);
      activity = Activity.fromJson(jsonResponse);
    } else {
      activity = Activity(
          activity: 'Activity',
          type: 'type',
          link: 'link',
          participants: 0,
          price: 0.0);
      debugPrint(response.body);
    }
    return activity;
  }
}
