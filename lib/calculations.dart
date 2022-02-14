class Calculation {
  double estimatecalc(int numberOfChicks, int availableFeeds) {
    const double perChick = 0.05;
    double estimate = availableFeeds / (perChick * numberOfChicks);
    return estimate;
  }

  double feed(double available, double used) {
    double differenceFeeds = available - used;
    return differenceFeeds;
  }
}
