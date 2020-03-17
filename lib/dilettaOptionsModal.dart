import 'package:flutter/material.dart';
import 'package:diletta_modal/dilettaModals.dart';

class DilettaOptionsModal extends DilettaBasicModal {

  ///The overlay (background) color of the modal 
  final Color overlayColor;
  ///Whether you can dismiss the modal by tapping the overlay
  final bool overlayDismissible;
  ///The color of the modal
  final Color modalColor;
  ///The margin applied to the modal
  final EdgeInsetsGeometry modalMargin;
  ///The border radius of the modal
  final double borderRadius;
  ///The vertical padding applied to the modal
  final EdgeInsetsGeometry contentPaddingVertical;
  ///The horizontal padding applied to the modal
  final EdgeInsetsGeometry contentPaddingHorizontal;
  ///The font used in modal
  final String fontFamily;
  ///The title font size
  final double titleFontSize;
  ///The title font color
  final Color titleFontColor;
  ///The title of the modal
  final String title;
  ///The padding applied to the modal's body
  final EdgeInsetsGeometry bodyPadding;
  ///The body font size
  final double bodyFontSize;
  ///The body font color
  final Color bodyFontColor;
  ///The body of the modal
  final String body;
  ///The color used as a divider
  final Color dividerColor;
  ///The size of the divider
  final double dividerSize;
  ///The padding applied to the modal's button
  final EdgeInsetsGeometry buttonPadding;
  ///The button font size
  final double buttonFontSize;
  ///The button font color
  final Color buttonFontColor;
  ///The cancel button text
  final String cancelButtonText;
  ///The confirm buttons text
  final String confirmButtonText;

  DilettaOptionsModal({
    this.overlayColor = OVERLAY_COLOR, 
    this.overlayDismissible = OVERLAY_DISMISSIBLE,
    this.modalColor = MODAL_COLOR,
    this.modalMargin = MODAL_MARGIN,
    this.borderRadius = MODAL_BORDER_RADIUS,
    this.contentPaddingVertical = MODAL_CONTENT_PADDING_VERTICAL,
    this.contentPaddingHorizontal = MODAL_CONTENT_PADDING_HORIZONTAL,
    this.fontFamily = MODAL_FONT_FAMILY,
    this.titleFontSize = MODAL_TITLE_FONT_SIZE,
    this.titleFontColor = MODAL_TITLE_FONT_COLOR,
    @required this.title,
    this.bodyPadding = MODAL_BODY_PADDING,
    this.bodyFontSize = MODAL_BODY_FONT_SIZE,
    this.bodyFontColor = MODAL_BODY_FONT_COLOR,
    @required this.body,
    this.dividerColor = MODAL_DIVIDER_COLOR,
    this.dividerSize = MODAL_DIVIDER_SIZE,
    this.buttonPadding = MODAL_BUTTON_PADDING,
    this.buttonFontSize = MODAL_BUTTON_FONT_SIZE,
    this.buttonFontColor = MODAL_BUTTON_FONT_COLOR,
    @required this.cancelButtonText,
    @required this.confirmButtonText
  });
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: this.overlayColor,
      body: Stack(
        children:[
          GestureDetector(
            onTap: () {
              if (overlayDismissible)
                Navigator.of(context).pop();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
          ),
          Container(
            margin: modalMargin,
            padding: contentPaddingVertical,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: modalColor
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: contentPaddingHorizontal,
                  child: Text(
                    title,
                    style: getTitleStyle(),
                  ),
                ),
                Padding(
                  padding: bodyPadding,
                  child: Container(
                    padding: contentPaddingHorizontal,
                    child: Text(
                      body,
                      style: getBodyStyle(),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: dividerSize,
                  color: dividerColor,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Container(
                          padding: buttonPadding,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                          child: Text(
                            cancelButtonText,
                            style: getButtonStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      width: dividerSize,
                      height: 24,
                      color: dividerColor,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Container(
                          padding: buttonPadding,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.transparent,
                          child: Text(
                            confirmButtonText,
                            style: getButtonStyle(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]
            )
          )
        ],
      ),
    );
  }

  getTitleStyle() => TextStyle(
    fontFamily: fontFamily,
    fontSize: titleFontSize,
    color: titleFontColor,
    fontWeight: FontWeight.w600
  );
  getBodyStyle() => TextStyle(
    fontFamily: fontFamily,
    fontSize: bodyFontSize,
    color: bodyFontColor,
    fontWeight: FontWeight.w400,
  );
  getButtonStyle() => TextStyle(
    fontFamily: fontFamily,
    fontSize: buttonFontSize,
    color: buttonFontColor,
    fontWeight: FontWeight.w500,
  );
}