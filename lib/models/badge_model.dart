class Badge {
  bool isRestricted;

  Badge({
    required this.isRestricted,
  });

  void restrictBadge() {
    isRestricted = true;
  }

  void unRestrictBadge() {
    isRestricted = false;
  }

}
