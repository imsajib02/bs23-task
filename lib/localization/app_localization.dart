import 'package:get/get.dart';

class AppLocalization extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {

    'en_US': {
      'app_name': 'BS23 Task',
      'oops': 'Oopss!',
      'data_failure': 'Failed to get data!',
      'try_again': 'Try Again',
      'no_internet': 'No internet connection!',
      'inactive_connection': 'Internet connection not working!',
      'timed_out': 'Timed out!',
      'STR_UNKNOWN_ERROR': 'Something went wrong!',
    },
    'bn_BD': {
      'app_name': 'বিএস২৩ টাস্ক',
      'oops': 'Oopss!',
      'data_failure': 'Failed to get data!',
      'try_again': 'Try Again',
      'no_internet': 'No internet connection!',
      'inactive_connection': 'Internet connection not working!',
      'timed_out': 'Timed out!',
      'STR_UNKNOWN_ERROR': 'Something went wrong!',
    }
  };
}