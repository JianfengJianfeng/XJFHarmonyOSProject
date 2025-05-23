import { CommonConstants } from '../constans/CommonConstants';
import { Home } from '../module/home/views/Home';
import { BreakpointConstants } from '../constans/BreakpointConstants';


@Entry
@Component
struct Index {
  @State message: string = 'Hello';
  @StorageLink('currentBreakpoint') currentBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;

  build() {
    RelativeContainer() {
      Home()
    }
    .backgroundColor(Color.White)
    .width('100%')
    .margin({ bottom: CommonConstants.TAB_BAR_HEIGHT,top: CommonConstants.TAB_BAR_HEIGHT })


    // GridRow({
    //   columns: {
    //     sm: BreakpointConstants.GRID_ROW_COLUMNS[0],
    //     md: BreakpointConstants.GRID_ROW_COLUMNS[1],
    //     lg: BreakpointConstants.GRID_ROW_COLUMNS[2]
    //   }
    // }) {
    //   GridCol({
    //     span: {
    //       sm: BreakpointConstants.GRID_COLUMN_SPANS[0],
    //       md: BreakpointConstants.GRID_COLUMN_SPANS[1],
    //       lg: BreakpointConstants.GRID_COLUMN_SPANS[4]
    //     }
    //   }) {
    //     Home()
    //   }
    //   .height(CommonConstants.FULL_PERCENT)
    //   .width(CommonConstants.FULL_PERCENT)
    // }
    // .onBreakpointChange((breakPoint) => {
    //   this.currentBreakpoint = breakPoint;
    // })
  }

  /**
   * 应用的主页面，禁止系统返回，解决首次从协议页面进来时导致的二次返回
   */
  onBackPress(): boolean | void {
    return true
  }

  /**
   * 界面开始展示
   */
  // onPageShow(): void {
  //
  // }


}