import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

getFormattedDate(DateTime dt, {String pattern = 'dd/MM/yyyy'}){
  return DateFormat(pattern).format(dt);
}

Future<bool> isConnectedToInternet() async {
  final result = await Connectivity().checkConnectivity();
  return result == ConnectivityResult.wifi ||
      result == ConnectivityResult.mobile;
}