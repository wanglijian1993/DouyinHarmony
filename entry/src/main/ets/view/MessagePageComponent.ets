import { MsgItem } from '../model/Bean';
import MsgViewModel from '../viewmodel/MsgViewModel';

@Component
export struct MessagePageComponent {

  @State nick:string='';
  @State msgs:Array<MsgItem>=MsgViewModel.getMsgs()

  build() {

    Column(){
      Row(){
        ForEach(
          this.msgs,
          (item:MsgItem,index:number)=>{
            Image(item.head)
              .height(60)
              .width(60)
              .clip(new Circle({width:60,height:60}))
              .margin({left:10})
          }
        )
      }
      .margin({top:10})
      List(){
        ForEach(
          this.msgs,
          (item: MsgItem, index: number) =>{
            MsgView({msg:item})
          }
        )
      }
      .margin({top:20})

    }
    .backgroundColor($r('app.color.color_white'))
  }


}
@Component
struct MsgView{
  @Prop msg:MsgItem
  build(){
    RelativeContainer(){
      Image(this.msg.head)
        .height(60)
        .width(60)
        .alignRules({
          top:{anchor:"__container__",align: VerticalAlign.Top},
          bottom:{anchor:"__container__",align:VerticalAlign.Bottom},
          left: {anchor: "__container__", align:HorizontalAlign.Start}
        })
        .clip(new Circle({width:60,height:60}))
        .margin({left:10})
        .id("img")
      Text(this.msg.nick)
        .alignRules({
          left: {anchor:"img",align:HorizontalAlign.End},
          top:{anchor:"img",align:VerticalAlign.Top}
        })
        .margin({left:10})
        .id('nick')

      Text('消息')
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