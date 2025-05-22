@Entry
@Component
struct Index {
  @State message: string = 'Hello';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize($r('app.float.font_size_20'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
    }
    .backgroundColor(Color.Red)
    .height('100%')
    .width('100%')
  }

  //应用的主页面，禁止系统返回，解决首次从协议页面进来时导致的二次返回
  onBackPress(): boolean | void {
    return true
  }
}