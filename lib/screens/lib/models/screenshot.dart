class Screenshot {
  final String aspect;
  final String imagePath;
  final int height;
  final int width;
  final String countryCode;
  final double voteAverage;
  final int voteCount;

  Screenshot(
      {this.aspect = '',
      this.imagePath = '',
      this.height = 0,
      this.width = 0,
      this.countryCode = '',
      this.voteAverage = 0.0,
      this.voteCount = 0});

  factory Screenshot.fromJson(Map<String, dynamic> json) {
    return Screenshot(
        aspect: json['aspect_ratio']
            .toString(), //double.tryParse(json['aspect_ratio'])?.toString() ?? 1.0,
        imagePath: json['file_path'],
        height: json['height'],
        width: json['width'],
        countryCode: json['iso_639_1'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }

  @override
  List<Object> get props =>
      [aspect, imagePath, height, width, countryCode, voteAverage, voteCount];
}
