import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immersive_boothcamp/data/model/banner_response_model.dart';
import 'package:immersive_boothcamp/data/services/banner_remote_data_service.dart';
import 'package:meta/meta.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRemoteData bannerRemoteData;

  BannerBloc({
    required this.bannerRemoteData,
  }) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerListEvent) {
        emit(BannerLoading());
        
        final result = await bannerRemoteData.getBanners();

        emit(BannerSuccess(bannerResponse: result));
      }
    });
  }
}
