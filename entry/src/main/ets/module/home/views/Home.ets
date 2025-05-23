import { HomeContent } from "./HomeContent";
import { BlankView } from "./BlankView";


@Component
export struct Home {

  @State currentIndex: number = 0;
  @Builder tabBuilder(title: string, targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#1296db' : '#6B6B6B')
        .fontSize(12)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Tabs({ barPosition:BarPosition.End }) {
        TabContent() {
          HomeContent()
        }
        .tabBar(this.tabBuilder('首页',0,$r('app.media.tabbar_home_selected'),$r('app.media.tabbar_home_normal')))

        TabContent() {
          BlankView()
        }
        .tabBar(this.tabBuilder('发现',1,$r('app.media.tabbar_find_selected'),$r('app.media.tabbar_find_normal')))

        TabContent() {
          BlankView()
        }
        .tabBar(this.tabBuilder('我的',2,$r('app.media.tabbar_mine_selected'),$r('app.media.tabbar_mine_normal')))
      }
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .scrollable(false)//禁止滑动
    }
  }
}
