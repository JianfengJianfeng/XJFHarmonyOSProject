import { CommonConstants } from '../../constans/CommonConstants'
import PreferencesUtil from '../../utils/PreferencesUtil'
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Protocol {

  private uiContext: UIContext = this.getUIContext();

  build() {
    /**
     * 相对布局
     */
    RelativeContainer() {
      /*
       * 最底层放置一个row，作为展示背景功能里边可以放置图片什么的任何背景
       */
      Row()
        .backgroundColor($r('app.color.view_bluish'))
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .height('100%')
        .width('100%')

      /**
       * 这部分展示协议内容
       */
      Row() {
        Text() {
          Span('您好~首先感谢您选择这个App\n我们深知个人信息非常重要，并会尽全力保护您的个人信息安全。我们会遵循')
          Span('《用户协议》').fontColor(Color.Blue).onClick(()=>{  })
          Span('与')
          Span('《隐私政策》').fontColor(Color.Blue).onClick(()=>{  })
          Span('收集、使用您的个人信息。\n如您同意本政策内容，请点击"同意并使用"开始使用我们的产品与服务。\n\n这是一条假的模拟用户隐私协议，测试持久化存储”用户首选项”的功能代码')
        }
        .fontSize(14)
        .fontColor(Color.Black)
        .padding(10)
        .lineHeight(20)
        .width('80%')
        .backgroundColor(Color.White)
        .borderRadius(8)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
      .id('row3')


      /**
       * 不同意在底部，相对父试图从底部开始布局
       */
      Row() {
        Text(){
          Span('不同意')
            .fontColor(Color.Grey)
            .fontSize(14)
            .fontStyle(FontStyle.Italic)
            .decoration({ type: TextDecorationType.Underline, color: Color.Grey })
            .onClick(() => {
              const context = getContext(this) as common.UIAbilityContext;//退出程序
              context.terminateSelf((err: BusinessError) => {
                if (!err) {
                  console.info('exit successed');
                }
              })
            })
        }
      }
      .id('no_agree')
      .width('100%')
      .height(84)
      .justifyContent(FlexAlign.Center)
      .alignRules({
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
        left: { anchor: '__container__', align: HorizontalAlign.Start }
      })

      /**
       * 同意按钮
       */
      Row() {
        Button('同意并继续',{ type:ButtonType.Normal,stateEffect: true})
          .backgroundColor(Color.Blue)
          .fontSize(15)
          .borderRadius(22)
          .width('80%')
          .onClick(() => {
             //1.使用用户首选项存储下值，下次打开app不再展示用户协议页面
             PreferencesUtil.putPreferenceValue(CommonConstants.PROTOCOL_DB, CommonConstants.PROTOCOL, CommonConstants.PROTOCOL_TRUE);
             //2.直接跳转到用户首页
             this.uiContext.getRouter().pushUrl({url: 'pages/Index'});
          })
      }
      .id('row4')
      .width('100%')
      .height(44)
      .justifyContent(FlexAlign.Center)
      .alignRules({
        bottom :{ anchor: 'no_agree', align: VerticalAlign.Top },
        left : { anchor : '__container__', align: HorizontalAlign.Start }
      })
    }
    .height('100%')
    .width('100%')
  }
}