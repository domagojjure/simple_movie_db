import './screenshot.dart';

class MovieImage {
  final List<Screenshot> posters;

  const MovieImage({required this.posters});

  factory MovieImage.fromJson(Map<String, dynamic> result) {
    return MovieImage(
      posters: (result['posters'] as List)
          .map((b) => Screenshot.fromJson(b))
          .toList(),
    );
  }

  // @override
  // List<Object> get props => [ posters];
}
