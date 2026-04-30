import 'dart:convert';

import 'package:uvalert/models/uv_model.dart';
import 'package:uvalert/storage/preferences.dart';

class Cache {
  final Preferences _prefs;

  Cache(this._prefs);

  Future<void> store(UvData data) async {
    final json = jsonEncode(data.toJson());
    await _prefs.setCachedPayload(json);
    await _prefs.setCachedPayloadAt(data.fetchedAt.toIso8601String());
  }

  UvData? read() {
    final raw = _prefs.cachedPayload;
    if (raw == null) return null;
    return UvData.fromJson(jsonDecode(raw));
  }

  bool isStale() {
    final at = _prefs.cachedPayloadAt;
    if (at == null) return true;
    final fetched = DateTime.parse(at);
    return DateTime.now().toUtc().difference(fetched).inHours >= 24;
  }

  bool isEmpty() => _prefs.cachedPayload == null;
}
