import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';

import '../models/json/matched_group.dart';

class FunctionsService extends Cubit<int> {
  final _functions = FirebaseFunctions.instance;

  FunctionsService() : super(-1);

  Future<List<MatchedGroup>> getOptimalMatches(String userId) async {
    final List<MatchedGroup> result = [];
    final response = await _functions.httpsCallable("find_group").call({
      "userId": userId,
    });

    final json = response.data as Map<String, dynamic>;
    for (var dataPoint in json.values) {
      final dataPointMap = dataPoint as Map<String, dynamic>;
      result.add(MatchedGroup.fromJson(dataPointMap));
    }

    return result;
  }
}
