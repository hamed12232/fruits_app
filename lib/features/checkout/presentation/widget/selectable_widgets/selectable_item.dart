import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/selectable_widgets/selectable_widget.dart';
import 'calendar_selector.dart';

class SelectableWidget extends StatefulWidget {
  final String title;
  final bool showDateSelector;
  final Function(DateTime?)? onDateSelected;
  final DateTime? initialDate;

  const SelectableWidget({
    super.key,
    required this.title,
    this.showDateSelector = false,
    this.onDateSelected,
    this.initialDate,
  });

  @override
  State<SelectableWidget> createState() => _SelectableWidgetState();
}

class _SelectableWidgetState extends State<SelectableWidget> {
  bool isSelected = false;
  DateTime? selectedDate;
  bool showCalendar = false;
  bool showTimePicker = false;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  void _toggleSelection() {
    setState(() {
      if (widget.showDateSelector) {
        showTimePicker = !showTimePicker;
      }
      isSelected = !isSelected;
      widget.onDateSelected?.call(isSelected ? DateTime.now() : null);
    });
  }

  void _toggleCalendar() {
    setState(() {
      showCalendar = !showCalendar;
    });
  }

  void _updateDate(DateTime date) {
    setState(() {
      selectedDate = date;
      showCalendar = false;
      widget.onDateSelected?.call(date);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SelectableMainCard(
          title: widget.title,
          isSelected: isSelected,
          showTimePicker: showTimePicker,
          selectedDate: selectedDate,
          showDateSelector: widget.showDateSelector,
          onCardTapped: _toggleSelection,
          onCalendarToggle: _toggleCalendar,
        ),
        if (widget.showDateSelector && showCalendar)
          CalendarSelector(
            selectedDate: selectedDate,
            onDateChanged: _updateDate,
          ),
      ],
    );
  }
}
