import MineViewModel from '../viewmodel/MineViewModel';
import { display } from '@kit.ArkUI';
import { CommonConstants } from '../constants/CommonConstants';


@Component
export struct MinePageComponent {

  @State nick:string='';

  @State tabs:Array<string>= MineViewModel.mineTabs

  @State private overScrollOffset: number = 0
  private maxOverScrollOffset: number = 120
  private defautBgHeig:number=200
  private lastTouchX = 0
  private lastTouchY = 0
  scroller: Scroller = new Scroller()
  build() {
    Scroll(this.scroller){
    Column(){
      Stack(){
        Image($r("app.media.ic_mine_background"))
          .width('100%')
          .objectFit(ImageFit.Fill)
          .height(this.overScrollOffset+ this.defautBgHeig)
          .scale({
            x: ((this.defautBgHeig  + this.overScrollOffset) / this.defautBgHeig) ,
            centerX: "50%",
            centerY: "50%"
          })
        RelativeContainer(){
          Image($r('app.media.head'))
            .width(60)
            .height(60)
            .alignRules({
              left:{anchor:"__container__",align:HorizontalAlign.Start},
              bottom:{anchor:"__container__",align:VerticalAlign.Bottom}
            })
            .objectFit(ImageFit.Fill)
            .clip(new Circle({width:60,height:60}))
            .margin({left:20,bottom:20})
            .id('head')
          Text('尼克')
            .fontColor($r('app.color.color_white'))
            .fontSize(16)
            .alignRules({
              top:{anchor:'head',align:VerticalAlign.Top},
              left:{anchor:'head',align:HorizontalAlign.End}
            })
            .margin({left:10})
            .id("nick")
          Text('20240523')
            .fontColor($r('app.color.color_white'))
            .fontSize(16)
            .alignRules({
              left:{anchor:'head',align:HorizontalAlign.End},
              bottom:{anchor:'head',align:VerticalAlign.Bottom}
            })
            .margin({left:10})
            .id("account")

        }
        .renderFit(RenderFit.RESIZE_FILL)
        .height('100%')
        .width('100%')
      }
      .width('100%')
      .height(this.overScrollOffset + this.defautBgHeig)
      Column(){
        Row(){
          Text('99')
            .fontColor($r('app.color.grid_title_color'))
            .fontSize(16)
            .fontStyle(FontStyle.Italic)
          Text('获赞')
            .fontColor($r('app.color.color_gray'))
            .fontSize(14)
            .fontStyle(FontStyle.Normal)
          Text('99')
            .fontColor($r('app.color.grid_title_color'))
            .fontSize(16)
            .fontStyle(FontStyle.Italic)
            .margin({left:15})
          Text('朋友')
            .fontColor($r('app.color.color_gray'))
            .fontSize(14)
            .fontStyle(FontStyle.Normal)
          Text('318')
            .fontColor($r('app.color.grid_title_color'))
            .fontSize(16)
            .fontStyle(FontStyle.Italic)
            .margin({left:15})
          Text('关注')
            .fontColor($r('app.color.color_gray'))
            .fontSize(14)
            .fontStyle(FontStyle.Normal)
          Text('318')
            .fontColor($r('app.color.grid_title_color'))
            .fontSize(16)
            .fontStyle(FontStyle.Italic)
            .margin({left:15})
          Text('粉丝')
            .fontColor($r('app.color.color_gray'))
            .fontSize(14)
            .fontStyle(FontStyle.Normal)
        }
        .padding({
          left:20,
          top:15
        })
      }
      .alignItems(HorizontalAlign.Start)

      Text('等你熬过所有的苦，就会遇见所有的甜')
        .margin({left:20,top:10})
        .fontColor($r('app.color.grid_title_color'))
        .fontSize(15)

      Row(){
        Row(){
          Image($r('app.media.ic_mine_boy'))
            .height(10)
            .width(10)

          Text('33')
            .fontSize(12)
            .fontColor($r('app.color.grid_title_color'))
            .margin({left:2})
        }
        .height('100%')
        .backgroundColor($r('app.color.responsive_layout_background'))
        .padding({
          left:3,top:2,right:3,bottom:2
        })
        Text('北京 昌平')
          .fontSize(12)
          .fontColor($r('app.color.grid_title_color'))
          .margin({left:2}).margin({left:5})
          .backgroundColor($r('app.color.responsive_layout_background'))
          .height('100%')

      }
      .height(20)
      .width(100)
      .margin({left:20,top:10})


      Flex({direction:FlexDirection.Row,justifyContent:FlexAlign.SpaceBetween}){

        Button('编辑资料',{type:ButtonType.Normal})
          .backgroundColor($r('app.color.color_mine_age_bg'))
          .fontColor($r('app.color.grid_title_color'))
          .width('48%')
          .borderRadius(5)

        Button('添加朋友',{type:ButtonType.Normal})
          .backgroundColor($r('app.color.color_mine_age_bg'))
          .fontColor($r('app.color.grid_title_color'))
          .width('48%')
          .borderRadius(5)

      }
      .height(40  )
      .width('100%')
      .padding({left:20,right:20})
      .margin({top:10})



      Tabs({ barPosition: BarPosition.Start }){
        ForEach(this.tabs,(item:string,index:number)=>{

          TabContent(){
            Text(item).fontSize(16).fontColor($r('app.color.grid_title_color'))
              .align(Alignment.TopStart)
          }
          .tabBar(item)
        })


      }
      .height('100%')
    }
    .height('100%')
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .onTouch((event: TouchEvent) => {
        this.handleOverScroll(event)
    })
    }
    .scrollable(ScrollDirection.Vertical)
    .width('100%')
  }




  handleOverScroll(event: TouchEvent) {
      if (event.type == TouchType.Down) {
        this.lastTouchX = event.touches[0].x
        this.lastTouchY = event.touches[0].y
      } else if (event.type == TouchType.Move) {
        const curTouchX = event.touches[0].x
        const curTouchY = event.touches[0].y
        const dx = curTouchX - this.lastTouchX
        const dy = curTouchY - this.lastTouchY
        if (Math.abs(dy) > Math.abs(dx)) {
          if (dy > 0) { // 向下滑动
            this.overScrollOffset = Math.min(this.overScrollOffset + dy, this.maxOverScrollOffset)
          }
        }
        this.lastTouchX = curTouchX
        this.lastTouchY = curTouchY
      } else if (event.type == TouchType.Up || event.type == TouchType.Cancel) {
        animateTo({
          duration: 200
        }, () => {
          this.overScrollOffset = 0
        })
      }

  }
}
