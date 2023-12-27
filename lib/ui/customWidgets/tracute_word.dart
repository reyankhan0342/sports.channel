class TrancuatWold {
  String truncateText(String text, int maxWords) {
    List<String> words = text.split(' ');
    if (words.length <= maxWords) {
      return text;
    }
    return words.take(maxWords).join(' ') + '...';
  }
}
