import { CommonConstants } from "../../../constans/CommonConstants"

@Component
export struct BlankView {
  build() {
    Column() {
      Image($r('app.media.blank_image'))
        .width($r('app.float.blank_view_width'))
        .height($r('app.float.blank_view_height'))
      Text($r('app.string.blank_view_text'))
        .fontSize($r('app.float.blank_view_font_size'))
        .opacity(0.3)
        .margin({ top: $r('app.float.blank_view_margin_top') })
    }
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
  }
}