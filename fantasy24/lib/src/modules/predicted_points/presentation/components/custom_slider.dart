import 'package:flutter/material.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/modules/predicted_points/presentation/controller/cubit/point_prediction_cubit.dart';

class CustomSliderWidget extends StatefulWidget {
  final PointPredictionCubit cubit;
  final double lowValue;
  final double highValue;
  final double minValue;
  final double maxValue;
  final String sliderType;
  const CustomSliderWidget({
    super.key,
    required this.cubit,
    this.lowValue = 1000000,
    this.highValue = 6000000,
    this.minValue = 1,
    this.maxValue = 4,
    required this.sliderType,
  });

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  @override
  void initState() {
    super.initState();
    widget.cubit.lowPice = widget.lowValue;
    widget.cubit.highPric = widget.highValue;
    widget.cubit.startGameWeek = widget.minValue;
    widget.cubit.endGameWeek = widget.maxValue;
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      labels: widget.sliderType == 'price'
          ? RangeLabels(widget.cubit.lowPice!.toStringAsFixed(2),
              widget.cubit.highPric!.toStringAsFixed(2))
          : RangeLabels(widget.cubit.startGameWeek!.toStringAsFixed(2),
              widget.cubit.endGameWeek!.toStringAsFixed(2)),
      values: widget.sliderType == 'price'
          ? RangeValues(widget.cubit.lowPice!, widget.cubit.highPric!)
          : RangeValues(widget.cubit.startGameWeek!, widget.cubit.endGameWeek!),
      max: widget.sliderType == 'price' ? widget.highValue : widget.maxValue,
      min: widget.sliderType == 'price' ? widget.lowValue : widget.minValue,
      activeColor: AppColors.white,
      inactiveColor: AppColors.white,
      overlayColor: const MaterialStatePropertyAll(AppColors.primary),
      onChanged: (RangeValues value) {
        setState(
          () {
            if (widget.sliderType == 'price') {
              widget.cubit.lowPice = value.start;
              widget.cubit.highPric = value.end;
            } else {
              widget.cubit.startGameWeek = double.parse(value.start.toString());
              widget.cubit.endGameWeek = double.parse(value.end.toString());
            }
          },
        );
      },
    );
  }
}
