class TimeUtils{
  
  static String idGenerator(){
    return DateTime.now().microsecondsSinceEpoch.toString();
  }
}