import 'package:json_annotation/json_annotation.dart';
import 'package:sport_app_example/data/remote/event/event.dart';

part 'event_response.g.dart';

@JsonSerializable()
class EventResponse {
  final List<Event>? events;

  EventResponse({this.events});

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);
}
