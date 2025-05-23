class BankItemData {
  final String imagePath;
  final String name;
  final bool showFreeLabel;
  final bool isFree;
  final String? subtitle;

  BankItemData({
    required this.imagePath,
    required this.name,
    this.showFreeLabel = false,
    this.isFree = false,
    this.subtitle,
  });
}