import { common } from "@kit.AbilityKit";
import { window } from "@kit.ArkUI";
/**
 * 窗口获取工具
 */
export default class WindowUtil {
  private constructor() {
  }
  private static instance: WindowUtil;
  private static sAbilityContext: common.UIAbilityContext;//获取组件配置信息能力
  private static sUiContext?: UIContext | null
  private static mainWindow?: window.Window | null

  public static getInstance(): WindowUtil {
    if (!WindowUtil.instance) {
      WindowUtil.instance = new WindowUtil();
    }
    return WindowUtil.instance;
  }

  /**
   * 获取应用上下文
   */
  public static getContext(): common.UIAbilityContext {
    return WindowUtil.sAbilityContext;
  }

  /**
   * 初始化工具类，
   * @param entryContext
   */
  public static init(entryContext: common.UIAbilityContext) {
    WindowUtil.sAbilityContext = entryContext
  }

  /**
   * 设置主窗口window
   */
  public static setMainWindow(mainWindow?: window.Window) {
    try {
      WindowUtil.mainWindow = mainWindow
      if (mainWindow) {
        WindowUtil.sUiContext = mainWindow.getUIContext()
      }
    } catch (e) {
      console.error(e)
    }
  }

}
