class FuncUtilities {
  FuncUtilities._();

  static get season {
    List<String> _season = [];
    for (var i = 0; i <= 10; i++) {
      int year = DateTime.now().year;
      String _stringBuilder = "${(year - 1) - i}-${year - i}";
      _season.add(_stringBuilder);
    }
    return _season;
  }
}
