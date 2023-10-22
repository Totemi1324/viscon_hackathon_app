import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:http/http.dart' as http;

import '../models/json/matched_group.dart';

class FunctionsService extends Cubit<int> {
  final _functions = FirebaseFunctions.instance;

  FunctionsService() : super(-1);

  Future<List<MatchedGroup>> getOptimalMatches(String userId) async {
    return [
      MatchedGroup("Grwyitbyh85idrltqorc3wg7eavgu8", 1.0),
      MatchedGroup("G97t82ye65myxfsoodhjqjy9dq3gvn", 0.8144329896907216),
      MatchedGroup("G4m5dz1d58yp77b5vrf09tjcj2dc9a", 0.711340206185567),
      MatchedGroup("Gr38jcbjttvozy7w5cvufim1n650xu", 0.6185567010309279),
      MatchedGroup("Gw4i8t0yhmwl6s40szzqcwbs0ymycp", 0.5670103092783505),
      MatchedGroup("Gd3w6lp2kpzxlrfpdbhyq55ixamduj", 0.5360824742268041),
      MatchedGroup("Gl1k169ew1svczl3nqh2txcsmg6z6w", 0.4948453608247423),
      MatchedGroup("G3fspsk4p5ope5e9ciiyp6y3ey0btl", 0.4020618556701031),
      MatchedGroup("Gnlsfziawfnw36bejyrv67kpuofkdx", 0.38144329896907214),
      MatchedGroup("Gokc52paqimj3v8r6q7g92t9d1t6ai", 0.3402061855670103),
    ];
  }
}
