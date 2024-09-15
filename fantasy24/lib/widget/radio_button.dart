import 'package:flutter/material.dart';
import 'package:next_match/src/core/utils/app_theme.dart';
import 'package:next_match/src/core/utils/constants.dart';

Container customChoosedRadio(
    {value,
    groupValue,
    // void Function()?onChanged,
    onChanged,
    title,
    color,
    symbil,
    symbolBackgroundColor,
    symbilColor}) {
  return Container(
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(10), color: color),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        title,
        style: AppTheme.textTheme.headlineSmall,
      ),
      trailing: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    ),
    // Row(
    //   children: [
    //     Radio(
    //       value: value,
    //       groupValue: groupValue,
    //       onChanged: onChanged,
    //     ),
    //     Text(title),
    //     const Spacer(),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 5),
    //       child: CircleAvatar(
    //         radius: 15,
    //         backgroundColor: symbolBackgroundColor,
    //         child: Center(
    //             child: Text(
    //           symbil,
    //           style: TextStyle(color: symbilColor, height: 1),
    //         )),
    //       ),
    //     )
    //   ],
    // ),
  );
}

Container customChoosedRadioWithImage(
    {value, groupValue, onChanged, title, color, img, borderColor, fontColor}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: color),
    child: Row(
      children: [
        // customSvg(name: img),
        Constatnts.width10,
        Text(
          title,
          style: TextStyle(color: fontColor),
        ),
        const Spacer(),
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    ),
  );
}

Container customChoosedRadioWithPng(
    {value, groupValue, onChanged, title, color, img, borderColor, fontColor}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
        color: color),
    child: Row(
      children: [
        // Image.asset(
        //   pngName(img),
        //   width: 40,
        // ),
        Constatnts.width10,
        Text(
          title,
          style: TextStyle(color: fontColor),
        ),
        const Spacer(),
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    ),
  );
}
