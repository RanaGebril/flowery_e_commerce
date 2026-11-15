import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<T> debounceRestartable<T>(
    Duration duration,
    ) {
  return (events, mapper) {
    return events
        .debounce(duration)
        .switchMap(mapper);
  };
}
