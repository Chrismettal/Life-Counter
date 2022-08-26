import 'imports.dart';

// Totty counter row
class TottyRow extends StatefulWidget {
  TottyRow({
    super.key,
    this.name = 'N/A',
  });

  final String name;

  @override
  State<TottyRow> createState() => _TottyRowState();
}

class _TottyRowState extends State<TottyRow> {
  int _value = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            children: [
              // Minus button
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: (_value > 0)
                      ? () {
                          setState(() {
                            HapticFeedback.mediumImpact();
                            _value--;
                          });
                        }
                      : null,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  '$_value',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      HapticFeedback.mediumImpact();
                      _value++;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

// Slider row
class SliderRow extends StatefulWidget {
  SliderRow({
    super.key,
    this.name = 'N/A',
  });

  final String name;

  @override
  State<SliderRow> createState() => _SliderRowState();
}

class _SliderRowState extends State<SliderRow> {
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: fontSize),
                      ),
                    ),
                    Expanded(flex: 2, child: Container())
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Slider(
                        value: _sliderValue,
                        max: 10,
                        divisions: 10,
                        label: _sliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            HapticFeedback.selectionClick();
                            _sliderValue = value;
                          });
                        },
                        onChangeEnd: (double value) =>
                            HapticFeedback.mediumImpact(),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        _sliderValue.round().toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ],
                ),
              ],
            )),
        const Divider(),
      ],
    );
  }
}

// Timer row
class TimerRow extends StatefulWidget {
  TimerRow({
    super.key,
    this.name = 'N/A',
  });

  final String name;

  @override
  State<TimerRow> createState() => _TimerRowState();
}

class _TimerRowState extends State<TimerRow> {
  DateTime lastRecord = never;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  (lastRecord == never)
                      ? 'Never'
                      : DateFormat('EEEE  yyyy-MM-dd HH:mm:ss')
                          .format(lastRecord),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                flex: 2,
                child: IconButton(
                  icon: const Icon(Icons.circle_outlined),
                  onPressed: () {
                    setState(() {
                      HapticFeedback.mediumImpact();
                      lastRecord = now;
                    });
                  },
                ),
              )
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

// Unused Header
class DayHeader extends StatefulWidget {
  const DayHeader({super.key});

  @override
  State<DayHeader> createState() => _DayHeaderState();
}

class _DayHeaderState extends State<DayHeader> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
          child: Text(
            'Entering: ${DateFormat('EEEE - yyyy-MM-dd').format(now)}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: fontSize),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
