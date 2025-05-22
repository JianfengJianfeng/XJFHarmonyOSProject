import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import ImmerseUtil from '../utils/ImmerseUtil'
import PreferencesUtil from '../utils/PreferencesUtil'
import { CommonConstants } from '../constans/CommonConstants';
import WindowUtil from '../utils/WindowUtil';

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    // 初始化 WindowUtil
    WindowUtil.init(this.context);
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    
    // 设置主窗口
    windowStage.getMainWindow((err, windowClass) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to obtain the main window. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      WindowUtil.setMainWindow(windowClass);
    });

    /**
     * 设置窗口展示（沉浸式）
     */
    ImmerseUtil.setWindowImmerse(windowStage)

    /**
     * 展示首页or协议页
     */
    PreferencesUtil.getPreferencesValue(CommonConstants.PROTOCOL_DB,CommonConstants.PROTOCOL)
      .then((value) => {
        const page = value === CommonConstants.PROTOCOL_TRUE ? 'pages/Index' : 'module/protocol/Protocol';
        windowStage.loadContent(page,(error) => {
          if (error.code) {
            hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(error));
            return;
          }
          hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
        })
      })
      .catch((err:Error) => {
        // 如果获取失败，默认显示隐私政策页面
        windowStage.loadContent('module/protocol/Protocol', (err) => {
          if (err.code) {
            hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
            return;
          }
          hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
        });
      })

  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}