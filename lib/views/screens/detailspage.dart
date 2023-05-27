import 'package:flutter/material.dart';
import 'package:movieapp_viva/models/moviemodel.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({Key? key}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    MovieModel movieModel =
        ModalRoute.of(context)!.settings.arguments as MovieModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${movieModel.title}",
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      movieModel.poster,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Row(
                  children: [
                    Text(
                      "${movieModel.title}",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "(${movieModel.released})",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    "${movieModel.runtime}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const Text(
                    "   |   ",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "${movieModel.lan}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      "${movieModel.plot}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
