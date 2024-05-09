import 'package:challenge_meli/ui/pages/home/bloc/home_bloc.dart';
import 'package:challenge_meli/ui/pages/home/widgets/carousel_slider_custom.dart';
import 'package:challenge_meli/ui/widgets/appbar_custom.dart';
import 'package:challenge_meli/ui/widgets/text_border_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadItemsCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // backgroundColor: Colors.transparent,
          appBar: const CustomAppBar(),
          body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is ItemsCategoryHasData
                  ? SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 15),
                            child: TextBorderCustom(
                              text: "Cámaras y Accesorios",
                            ),
                          ),
                          CarouselSliderCustom(
                            items: state.data1!.results!,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 15),
                            child: TextBorderCustom(
                              text: "Celulares y Teléfonos",
                            ),
                          ),
                          CarouselSliderCustom(
                            items: state.data2!.results,
                            autoPlay: false,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 15),
                            child: TextBorderCustom(
                              text: "Electrodomésticos",
                            ),
                          ),
                          CarouselSliderCustom(
                            items: state.data3!.results,
                            autoPlay: false,
                          ),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
