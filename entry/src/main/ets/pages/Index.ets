import { CommonConstants } from '../constants/CommonConstants';
import { TabBarItem } from '../model/Bean';
import { FriendsPageComponent } from '../view/FriendsPageComponent';
import { HomePageComponent } from '../view/HomePageComponent';
import { MessagePageComponent } from '../view/MessagePageComponent';
import { MinePageComponent } from '../view/MinePageComponent';
import TabsViewModel from '../viewmodel/TabsViewModel';

@Entry
@Component
struct Index {
  build() {
    Column() {
      TabIndex()
    }
  }
}

@Component
export struct TabIndex {
  @State currentIndex: number = 0;
  @State tabs: Array<TabBarItem> = TabsViewModel.getTabData();


  @Builder TabBarBuilder(tabBar: TabBarItem, index?: number) {
    Flex({
      direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center
    }) {
      Image(this.currentIndex === index ? tabBar.selectIcon : tabBar.icon)
        .size({ width: $r('app.float.tab_img_width'), height: $r('app.float.tab_img_height') })
      Text(tabBar.name)
        .fontSize($r('app.float.tab_text_font_size'))
        .fontColor(this.currentIndex === index ? $r('app.color.tab_text_active') : $r('app.color.tab_text_normal'))
        .margin({ top: $r('app.float.tab_text_sm_top'), left: $r('app.float.tab_text_sm_left') })
    }
    .width(CommonConstants.FLEX_TAB_BAR_WIDTH)
    .height(CommonConstants.FLEX_TAB_BAR_HEIGHT)
  }

  build() {
    Column() {
      Tabs({
        barPosition:BarPosition.End}) {
        ForEach(this.tabs, (item: TabBarItem, index?: number) => {
          TabContent()   {
            if(index==0){
              HomePageComponent({nick:item.name})
            }else if(index==1){
              FriendsPageComponent({nick:item.name})
            }else if(index==2){
              MessagePageComponent({nick:item.name})
            }else if(index==3){
              MinePageComponent({nick:item.name})
            }
          }
          .tabBar(this.TabBarBuilder(item, index))
          .width(CommonConstants.TAB_CONTENT_WIDTH)
          .height(CommonConstants.TAB_CONTENT_HEIGHT)
        })
      }
      .vertical(CommonConstants.TAB_SM_VERTICAL)
      .barWidth(CommonConstants.TAB_SM_BAR_WIDTH)
      .barHeight(CommonConstants.TAB_SM_BAR_HEIGHT)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .backgroundColor($r('app.color.responsive_layout_background'))
  }


}