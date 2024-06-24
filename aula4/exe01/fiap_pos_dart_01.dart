import 'package:intl/intl.dart';

void main() {
  var now = DateTime.now();
  var formatter = DateFormat('dd/MM/yyyy HH:mm');
  String formattedDate = formatter.format(now);
  
  print('Data formatada: $formattedDate');
}