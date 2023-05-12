import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/main_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Тест'),
        ),
        body: Builder(builder: (context) {
          final stringList = context.select((MainProvider mainProvider) => mainProvider.mainList);
          return Column(
            children: [
              TextButton(
                onPressed: context.read<MainProvider>().addStrings,
                child: const Text('Добавить'),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ...stringList
                              .map((e) => Center(
                                    child: Text(
                                      e,
                                      style: const TextStyle(color: Colors.black),
                                    ),
                                  ))
                              .toList(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //TODO5 при заполнении экрана данный виджет должен становиться последним в списке и уезжать за экран
              const Center(
                child: Text(
                  'Динамичный виджет',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          );
        }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                //TODO3 данная кнопка должна добавлять элементы в список
              },
              tooltip: 'Add',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                //TODO3 данная кнопка должна удалять элементы из списка
              },
              tooltip: 'Remove',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
