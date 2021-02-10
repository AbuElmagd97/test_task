import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testtask/model/img.dart';
import 'package:testtask/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  ApiService apiService;

  @override
  void initState() {
    apiService = ApiService();
    apiService.getMoreImages();

    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //if we are at the bottom of the page
        apiService.getMoreImages();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: _imagesList(),
      ),
    );
  }

  Widget _imagesList() {
    return FutureBuilder(
      future: apiService.getImages(2),
      builder: (BuildContext context, AsyncSnapshot<List<Img>> snapshot) {
        if (snapshot.hasData) {
          return _buildListImages(snapshot.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildListImages(List<Img> images) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          var data = images[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width,
                height: height * 0.2,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    width: width,
                    fit: BoxFit.cover,
                    imageUrl: data.downloadUrl,
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                  ),
                ),
                margin: EdgeInsets.all(10.0),
              ),
            ],
          );
        },
      ),
    );
  }
}
