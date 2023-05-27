import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_viva/models/moviemodel.dart';
import 'package:movieapp_viva/utills/helpers/apihelper.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<MovieModel?> getAllMovie;

  @override
  void initState() {
    getAllMovie = APIHelper.apiHelper.fetchallmovie(
      search: "Baaghi",
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Movie details App",
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  onSubmitted: (val) {
                    setState(() {
                      getAllMovie = APIHelper.apiHelper.fetchallmovie(
                        search: val,
                      );
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: "Search here..",
                    suffixIcon: Icon(Icons.search,),
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: FutureBuilder(
                  future: getAllMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("ERROR:${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      MovieModel? data = snapshot.data;

                      // MovieModel? data = snapshot.data;
                      print(data);
                      return (data == null)
                          ? const Center(
                              child: Text("No data available..."),
                            )
                          : Container(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),

                                  Container(
                                    height: 400,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(data.poster),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${data.title}",
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '${data.imdbvotes}',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "${data.metascore}",
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "${data.imdbrating}",
                                        style: const TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "imdbvotes",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "metascore",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        "imdbrating",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed('Detailspage',arguments: data);
                                    },
                                    child: const Text(
                                      "View",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ////
  }
}
