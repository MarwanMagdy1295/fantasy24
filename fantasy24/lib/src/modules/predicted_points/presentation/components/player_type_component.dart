import 'package:flutter/material.dart';
import 'package:next_match/src/core/utils/app_colors.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/modules/predicted_points/presentation/controller/cubit/point_prediction_cubit.dart';

class PlayerTypeWidget extends StatefulWidget {
  final PointPredictionCubit cubit;
  const PlayerTypeWidget({
    super.key,
    required this.cubit,
  });

  @override
  State<PlayerTypeWidget> createState() => _PlayerTypeWidgetState();
}

class _PlayerTypeWidgetState extends State<PlayerTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.cubit.playerType = '';
            });
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
                child: Radio(
                    value: '',
                    groupValue: widget.cubit.playerType,
                    activeColor: AppColors.primary,
                    onChanged: (g) {
                      setState(() {
                        widget.cubit.playerType = g;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'All',
                  style: AppTheme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.cubit.playerType = '1';
            });
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
                child: Radio(
                    value: '1',
                    groupValue: widget.cubit.playerType,
                    activeColor: AppColors.primary,
                    onChanged: (g) {
                      setState(() {
                        widget.cubit.playerType = g;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'GK',
                  style: AppTheme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.cubit.playerType = '2';
            });
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
                child: Radio(
                    value: '2',
                    groupValue: widget.cubit.playerType,
                    activeColor: AppColors.primary,
                    onChanged: (g) {
                      setState(() {
                        widget.cubit.playerType = g;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'FWD',
                  style: AppTheme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.cubit.playerType = '3';
            });
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
                child: Radio(
                    value: '3',
                    groupValue: widget.cubit.playerType,
                    activeColor: AppColors.primary,
                    onChanged: (g) {
                      setState(() {
                        widget.cubit.playerType = g;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'MID',
                  style: AppTheme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.cubit.playerType = '4';
            });
          },
          child: Row(
            children: [
              SizedBox(
                width: 20,
                child: Radio(
                    value: '4',
                    groupValue: widget.cubit.playerType,
                    activeColor: AppColors.primary,
                    onChanged: (g) {
                      setState(() {
                        widget.cubit.playerType = g;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  'DEF',
                  style: AppTheme.textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
