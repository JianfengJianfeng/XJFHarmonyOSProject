
import NewsTypeModel from '../module/home/viewmodels/NewsTypeModel';

export class HomeConstants {

  /**
   * TabBars un select text font weight.
   */
  public static readonly TAB_BARS_UN_SELECT_TEXT_FONT_WEIGHT: number = 400;

  /**
   * TabBars select text font weight.
   */
  public static readonly TAB_BARS_SELECT_TEXT_FONT_WEIGHT: number = 700;

  /**
   * TabBars bar height.
   */
  public static readonly TAB_BARS_BAR_HEIGHT: string = '3.6%';

  /**
   * TabBars horizontal padding.
   */
  public static readonly TAB_BARS_HORIZONTAL_PADDING: string = '2.2%';

  /**
   * TabBars bar width.
   */
  public static readonly TAB_BARS_BAR_WIDTH: string = '100%';

  /**
   * TabBars default news types.
   */
  public static readonly TAB_BARS_DEFAULT_NEWS_TYPES: NewsTypeModel[] = [
    { id: 0, name: $r('app.string.tab_bar_type1') },
    { id: 1, name: $r('app.string.tab_bar_type2') },
    { id: 2, name: $r('app.string.tab_bar_type3') },
    { id: 3, name: $r('app.string.tab_bar_type4') },
    { id: 4, name: $r('app.string.tab_bar_type5') },
    { id: 5, name: $r('app.string.tab_bar_type6') },
    { id: 6, name: $r('app.string.tab_bar_type7') },
    { id: 7, name: $r('app.string.tab_bar_type8') }
  ];
}