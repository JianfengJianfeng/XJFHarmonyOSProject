import { CommonConstants } from '../../../constans/CommonConstants';
import NewsTypeModel from '../viewmodels/NewsTypeModel';
import newsViewModel from '../viewmodels/NewsViewModel';
import { HomeConstants as Const } from '../../../constans/HomeConstants';
import { BreakpointConstants } from '../../../constans/BreakpointConstants';


@Component
export default struct TabBar {
  @State tabBarArray: NewsTypeModel[] = newsViewModel.getDefaultTypeList();
  @State currentIndex: number = CommonConstants.ZERO;
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;

  // [Start tab_bar]
  @Builder
  TabBuilder(id: number, index: number) {
    Column() {
      Text(this.tabBarArray[id].name)
        // [StartExclude text]
        .height(CommonConstants.FULL_PERCENT)
        .padding({ left: Const.TAB_BARS_HORIZONTAL_PADDING, right: Const.TAB_BARS_HORIZONTAL_PADDING })
        .fontSize(this.currentIndex === index ?
          (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
          $r('app.float.tab_bar_font_size_20') : $r('app.float.tab_bar_font_size_22')) :
          (this.currentBreakpoint === BreakpointConstants.BREAKPOINT_SM ?
          $r('app.float.tab_bar_font_size_16') : $r('app.float.tab_bar_font_size_18')))
        .fontWeight(this.currentIndex === index ?
        Const.TAB_BARS_SELECT_TEXT_FONT_WEIGHT : Const.TAB_BARS_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.fontColor_text3'))
      // [EndExclude text]
    }
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Tabs({ barPosition: BarPosition.Start }) {
      ForEach(this.tabBarArray, (tabsItem: NewsTypeModel, index: number) => {
        TabContent() {
          // [StartExclude pull_to_refresh_news]
          //PullToRefreshNews()
          // [EndExclude pull_to_refresh_news]
        }
        // [StartExclude tab_bar]
        .tabBar(this.TabBuilder(tabsItem.id, index))
        // [EndExclude tab_bar]
      }, (item: NewsTypeModel) => JSON.stringify(item));
    }
    // [StartExclude bar_height]
    .barHeight(Const.TAB_BARS_BAR_HEIGHT)
    .barMode(BarMode.Scrollable)
    .barWidth(Const.TAB_BARS_BAR_WIDTH)
    .vertical(false)
    // [EndExclude bar_height]
    .onAnimationStart((_index: number, targetIndex: number, _event: TabsAnimationEvent) => {
      this.currentIndex = targetIndex;
    })
  }
  // [End tab_bar]
}