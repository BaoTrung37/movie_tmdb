extension StringExtension on String {
  String get tmdbOriginPath => 'https://image.tmdb.org/t/p/original$this';
  String get tmdbW154Path => 'https://image.tmdb.org/t/p/w154$this';
  String get tmdbW300Path => 'https://image.tmdb.org/t/p/w300$this';
}
