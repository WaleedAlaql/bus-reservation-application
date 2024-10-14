import 'package:bus_reservation_application/datasource/data_source.dart';
import 'package:bus_reservation_application/datasource/temp_db.dart';
import 'package:bus_reservation_application/models/app_user.dart';
import 'package:bus_reservation_application/models/auth_response_model.dart';
import 'package:bus_reservation_application/models/bus_model.dart';
import 'package:bus_reservation_application/models/bus_reservation.dart';
import 'package:bus_reservation_application/models/bus_schedule.dart';
import 'package:bus_reservation_application/models/but_route.dart';
import 'package:bus_reservation_application/models/response_model.dart';
import 'package:bus_reservation_application/utils/constants.dart';

class DummyDataSource extends DataSource {
  @override
  Future<ResponseModel> addBus(Bus bus) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> addReservation(BusReservation reservation) async {
    TempDB.tableReservation.add(reservation);
    return ResponseModel(
      responseStatus: ResponseStatus.SAVED,
      statusCode: 200,
      message: 'Reservation added successfully',
      object: {},
    );
  }

  @override
  Future<ResponseModel> addRoute(BusRoute busRoute) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> addSchedule(BusSchedule busSchedule) {
    throw UnimplementedError();
  }

  @override
  Future<List<Bus>> getAllBus() {
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getAllReservation() async {
    return TempDB.tableReservation;
  }

  @override
  Future<List<BusRoute>> getAllRoutes() {
    throw UnimplementedError();
  }

  @override
  Future<List<BusSchedule>> getAllSchedules() {
    throw UnimplementedError();
  }

  @override
  Future<List<BusReservation>> getReservationsByMobile(String mobile) async {
    return TempDB.tableReservation
        .where((element) => element.customer.mobile == mobile)
        .toList();
  }

  @override
  Future<List<BusReservation>> getReservationsByScheduleAndDepartureDate(
      int scheduleId, String departureDate) async {
    return TempDB.tableReservation
        .where((element) =>
            element.scheduleId == scheduleId &&
            element.departureDate == departureDate)
        .toList();
  }

  @override
  Future<BusRoute?> getRouteByCityFromAndCityTo(
      String cityFrom, String cityTo) async {
    BusRoute? route;
    try {
      route = TempDB.tableRoute.firstWhere((element) =>
          element.cityFrom == cityFrom && element.cityTo == cityTo);
      return route;
    } on StateError {
      return null;
    }
  }

  @override
  Future<BusRoute?> getRouteByRouteName(String routeName) {
    throw UnimplementedError();
  }

  @override
  Future<List<BusSchedule>> getSchedulesByRouteName(String routeName) async {
    return TempDB.tableSchedule
        .where((element) => element.routeName == routeName)
        .toList();
  }

  @override
  Future<AuthResponseModel?> login(AppUser user) {
    throw UnimplementedError();
  }
}
