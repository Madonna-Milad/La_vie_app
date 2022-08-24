import 'package:bloc/bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via_app/cubit/scan_cubit/scan_states.dart';

class ScanCubit extends Cubit<ScanStates>{
  ScanCubit() : super(InitialState());


  static ScanCubit get(context)=>BlocProvider.of(context);

  String qrString = '';
  bool alreadyRead = false;
  bool showBottomSheet = false;

  void displayBottomSheet(){
showBottomSheet=true;
emit(ShowBottomSheetState());
  }


  void ScanSuccessfully(String value){
     qrString = value;
      alreadyRead = true;
      emit(ScanSuccessfullyState());
  }

  void cannotScan(){
     qrString = 'unable to read this';
     emit(WrongScanState());
  }

   Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CE', 'Cancel', true, ScanMode.QR)
          .then((value) {
       ScanSuccessfully(value);
       emit(ScanState());
      });
    } catch (e) {
    cannotScan();
    }
  }

  

}

