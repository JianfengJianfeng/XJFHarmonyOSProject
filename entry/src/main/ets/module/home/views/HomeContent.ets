import { CommonConstants } from "../../../constans/CommonConstants";
import TabBar from "./TabBar";

@Component
export struct HomeContent {
  build() {
    Column() {
      TabBar()
        .margin({ bottom: CommonConstants.TAB_BAR_HEIGHT })
    }
    .alignItems(HorizontalAlign.Start)
    .height(CommonConstants.FULL_PERCENT)
    .width(CommonConstants.FULL_PERCENT)
  }
}