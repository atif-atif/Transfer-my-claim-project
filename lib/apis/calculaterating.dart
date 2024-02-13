Future<dynamic> calculaterating({list, flg = 0}) async {
  double totalRating = 0.0;
  int numRatings = 0;
  print(list);
  print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
  for (var userRating in list) {
    totalRating += userRating;
    numRatings++;
  }

  var averageRating = (totalRating /numRatings );
  return (flg == 0) ? averageRating : averageRating * 100;
}
