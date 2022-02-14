class feeds {
  double? feeds_available;
  double? feeds_used;
  double? feeds_purchased;

  feeds({
    required this.feeds_available,
    required this.feeds_used,
    required this.feeds_purchased,
  });

  Map<String, dynamic> toJson() => {
        'feeds_available': feeds_available,
        'feeds_used': feeds_used,
        'feeds_purchased': feeds_purchased,
      };
}
