import 'imports.dart';
import 'row_widgets.dart';

void main() {
  runApp(LifeCounter());
}

// App Frame
class LifeCounter extends StatefulWidget {
  const LifeCounter({super.key});

  @override
  State<LifeCounter> createState() => _LifeCounterState();
}

class _LifeCounterState extends State<LifeCounter> {
  // Tick the clock
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (v) {
      setState(() {
        now = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // Scaffold
      home: Scaffold(
        // Global AppBar
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(DateFormat('EEEE  yyyy-MM-dd').format(now)),
        ),

        // Body
        body: CounterBody(),

        // Drawer
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero, // Makes drawer color show behind top bar
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Life Counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Contact'),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Coffee'),
              ),
            ],
          ),
        ),

        // Floating button
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

// Actual body
class CounterBody extends StatefulWidget {
  CounterBody({super.key});

  @override
  State<CounterBody> createState() => _CounterBodyState();
}

class _CounterBodyState extends State<CounterBody> {
  // Hardcoded list for testing
  List<CounterRow> debugList = [
    const CounterRow(title: 'Kaffee', position: 1, type: typeTotty, reset: resetDaily),
    const CounterRow(title: 'Bier', position: 2, type: typeTotty, reset: resetDaily),
    const CounterRow(title: 'Tee', position: 3, type: typeTotty, reset: resetDaily),
    const CounterRow(title: 'Health', position: 4, type: typeSlider, reset: resetNever),
    const CounterRow(title: 'Happiness', position: 5, type: typeSlider, reset: resetNever),
    const CounterRow(title: 'Last Food', position: 6, type: typeTimer, reset: resetNever),
  ];


  @override
  Widget build(BuildContext context) {

    // Generate list of widgets
    final children = <Widget>[];
    for (var row in debugList) {
      if (row.type == typeTotty) {
        children.add(TottyRow(name: row.title));
      } else if (row.type == typeSlider) {
        children.add(SliderRow(name: row.title));
      } else if (row.type == typeTimer) {
        children.add(TimerRow(name: row.title));
      }
    }
    // Actually display generated list
    return ListView(
      children: children,
    );
  }
}
