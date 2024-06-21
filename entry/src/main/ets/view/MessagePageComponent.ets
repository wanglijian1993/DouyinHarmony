import { MsgItem } from '../model/Bean';
import MsgViewModel from '../viewmodel/MsgViewModel';

@Component
export struct MessagePageComponent {

  @State nick:string='';
  @State msgs:Array<MsgItem>=MsgViewModel.getMsgs()
  @State offsetX: number = 0
  @State positionX: number = 0
  build() {
    Column(){
      Row(){
        Image($r("app.media.ic_more"))
          .width(15)
          .height(15)
          .onClick((event:ClickEvent)=>{

          })
        Image($r("app.media.ic_seach"))
          .width(20)
          .height(20)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({left:15,right:15})
      .width('100%')
      .height(30)
      .alignItems(VerticalAlign.Center)
      Row(){
        ForEach(
          this.msgs,
          (item:MsgItem,index:number)=>{
            MsgTopView({ item:item})
          }
        )
      }
      .translate({ x: this.offsetX })
      .gesture(
        PanGesture().onActionUpdate( (event: GestureEvent) => {
          this.offsetX = this.positionX + event.offsetX
        })
          .onActionEnd( (event: GestureEvent) => {
            this.positionX = this.offsetX
          })
      )
      .margin({top:10})
      List(){
        ForEach(
          this.msgs,
          (item: MsgItem, index: number) =>{
            MsgView({msg:item})
          },(item: MsgItem, index: number) => { return index + '__' + JSON.stringify(item)}
        )
      }
      .margin({top:10,left:15})
    }
    .backgroundColor($r('app.color.color_white'))
  }
}

@Component
struct MsgTopView{
  @Prop item: MsgItem
  build(){
    Column(){
      Image(this.item.head)
        .height(60)
        .width(60)
        .clip(new Circle({width:60,height:60}))
      Text(this.item.nick)
        .margin({top:10})
    }
    .width(100)
    .alignItems(HorizontalAlign.Center)
  }
}

@Component
struct MsgView{
  @Prop msg:MsgItem
  build(){
    RelativeContainer(){
      Image(this.msg.head)
        .height(40)
        .width(40)
        .alignRules({
          top:{anchor:"__container__",align: VerticalAlign.Top},
          bottom:{anchor:"__container__",align:VerticalAlign.Bottom},
          left: {anchor: "__container__", align:HorizontalAlign.Start}
        })
        .clip(new Circle({width:40,height:40}))
        .margin({left:10})
        .id("img")
      Text(this.msg.nick)
        .alignRules({
          left: {anchor:"img",align:HorizontalAlign.End},
          top:{anchor:"img",align:VerticalAlign.Top}
        })
        .margin({left:10})
        .id('nick')
      Text(this.msg.msg)
        .alignRules({
          left: {anchor:"img",align:HorizontalAlign.End},
          bottom:{anchor:"img",align:VerticalAlign.Bottom}
        })
        .margin({left:10})
        .id('msg')
    }
    .height(80)
    .width('100%')
  }
}