import 'package:challenge_meli/domain/entities/items_category_entity.dart';
import 'package:challenge_meli/domain/use_cases/get_meli_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMeliApi _getMeliApi;
  HomeBloc(this._getMeliApi) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadItemsCategory) {
        emit(ItemsCategoryLoading());
        // "id": "MCO1039",
        // "name": "Cámaras y Accesorios"
        final responseData1 = await _getMeliApi.getItemsCategories(
            offset: event.offset, category: "MCO1039");
        await responseData1.fold(
          (failureData1) {
            emit(ItemsCategoryError(failureData1.message));
          },
          (data1) async {
            // "id": "MCO1051",
            // "name": "Celulares y Teléfonos"
            final responseData2 = await _getMeliApi.getItemsCategories(
                offset: event.offset, category: "MCO1051");
            await responseData2.fold(
              (failureData2) {
                emit(ItemsCategoryError(failureData2.message));
              },
              (data2) async {
        //  "id": "MCO5726",
        // "name": "Electrodomésticos"
                final responseData3 = await _getMeliApi.getItemsCategories(
                    offset: event.offset, category: 'MCO5726');
                responseData3.fold(
                  (failureData3) {
                    emit(ItemsCategoryError(failureData3.message));
                  },
                  (data3) {
                    emit(ItemsCategoryHasData(
                        data1: data1, data2: data2, data3: data3));
                  },
                );
              },
            );
          },
        );
      }
    });
  }
}
