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
    getAllMovie = APIHelper.apiHelper.fetchallmovie(search: "Baaghi");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movie App",
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
                                  // Container(
                                  //   height: 600,
                                  //   width: double.infinity,
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.black12,
                                  //     borderRadius: BorderRadius.circular(
                                  //       20,
                                  //     ),
                                  //   ),
                                  //   child: Column(
                                  //     children: [
                                  //       SizedBox(
                                  //         height: 20,
                                  //       ),
                                  //
                                  //     ],
                                  //   ),
                                  // ),
                                  Card(
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('Detailspage',arguments: data);
                                      },
                                      title: Text(
                                        "${data.title}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text("${data.director}",
                                          style: TextStyle(fontSize: 16)),
                                      trailing: Text(
                                        "${data.year}",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  )
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
