import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

/**
 * 沉浸式窗口设置
 */
class ImmerseUtil {

  /**
   * 根据需求，设置窗口的显示样式
   * @param windowStage
   */
  setWindowImmerse(windowStage: window.WindowStage) {
    /**
     * 1.获取应用主窗口。
     */
    let windowClass: window.Window | null = null;
    windowStage.getMainWindow((err: BusinessError, data) => {
      let errCode: number = err.code;
      if (errCode) {
        console.error('xjf Failed to obtain the main window. Cause: ' + JSON.stringify(err));
        return;
      }
      windowClass = data;
      console.info('xjf Succeeded in obtaining the main window. Data: ' + JSON.stringify(data));

      /**
       * 2.实现沉浸式效果。方式一：设置导航栏、状态栏不显示。
       */
      // let names: Array<'status' | 'navigation'> = [];
      // windowClass.setWindowSystemBarEnable(names)
      //   .then(() => {
      //     console.info('xjf Succeeded in setting the system bar to be visible.');
      //   })
      //   .catch((err: BusinessError) => {
      //     console.error('xjf Failed to set the system bar to be visible. Cause:' + JSON.stringify(err));
      //   });

      /**
       * 2.实现沉浸式效果。方式二：设置窗口为全屏布局，配合设置导航栏、状态栏的透明度、背景/文字颜色及高亮图标等属性，与主窗口显示保持协调一致。
       */
      let isLayoutFullScreen = true;
      windowClass.setWindowLayoutFullScreen(isLayoutFullScreen)
        .then(() => {
          console.info('xjf Succeeded in setting the window layout to full-screen mode.');
        })
        .catch((err: BusinessError) => {
          console.error('xjf Failed to set the window layout to full-screen mode. Cause:' + JSON.stringify(err));
        });
      let sysBarProps: window.SystemBarProperties = {
        //statusBarColor:  '#ff00ff',不设置显示导航栏信息会是透明状态
        navigationBarColor: '#00ff00',
        statusBarContentColor: '#ffffff',
        navigationBarContentColor: '#ffffff'
      };
      windowClass.setWindowSystemBarProperties(sysBarProps)
        .then(() => {
          console.info('xjf Succeeded in setting the system bar properties.');
        })
        .catch((err: BusinessError) => {
          console.error('xjf Failed to set the system bar properties. Cause: ' + JSON.stringify(err));
        });
    })

    /**
     * 3.为沉浸式窗口加载对应的目标页面.针对部分页面选择沉浸式时使用，比如播放视频页面等
    */
    // windowStage.loadContent("pages/Index", (err: BusinessError) => {
    //   let errCode: number = err.code;
    //   if (errCode) {
    //     console.error('xjf Failed to load the content. Cause:' + JSON.stringify(err));
    //     return;
    //   }
    //   console.info('xjf Succeeded in loading the content.');
    // });

  }
}

let immerseUtil = new ImmerseUtil()

export default immerseUtil as ImmerseUtil;