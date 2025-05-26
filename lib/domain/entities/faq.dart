enum FAQType {
  hardware,
  software,
  account,
}

class FAQ {
  final String id;
  final String title;
  final String description;
  final FAQType type;

  FAQ({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
  });
}