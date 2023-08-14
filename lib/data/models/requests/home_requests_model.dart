class SearchStayRequest {
  final String goingTo;
  final DateTime startTime;
  final DateTime endTime;
  final int roomCount;
  final int adultCount;
  final List<int> childrenAges;

  SearchStayRequest({
    required this.goingTo,
    required this.startTime,
    required this.endTime,
    required this.roomCount,
    required this.adultCount,
    required this.childrenAges,
  });
}
