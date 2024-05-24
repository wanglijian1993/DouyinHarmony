import { CommonConstants } from '../constants/CommonConstants';
import { HomeItem } from '../model/Bean';
import HomeViewModel from '../viewmodel/HomeViewModel';

@Component
export  struct HomePageComponent {
  @State nick:string='';
  @State homeItems:Array<HomeItem>=HomeViewModel.getHomeItems()
  build() {
  List(){
     ForEach(this.homeItems,(item:HomeItem)=>{
         HomeViewItem({homeItem:item})
     })
  }
  .height(CommonConstants.HOME_CONTENT_HEIGHT)
  .width(CommonConstants.HOME_CONTENT_WIDTH)
  }
}
@Component
struct HomeViewItem{
  @Prop homeItem:HomeItem;
  controller:VideoController=new VideoController();
   BottomEnd:Record<string,Record<string,string|VerticalAlign|HorizontalAlign>> = {
     'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
     'right': { 'anchor': '__container__', 'align': HorizontalAlign.End }
   }
  BottomLeft:Record<string,Record<string,string|VerticalAlign|HorizontalAlign>> = {
    'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
    'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
  }
  build(){
    RelativeContainer(

    ){
      Video(
        {
          src:$rawfile('01video.mp4'),
          previewUri: $r('app.media.01videopro'),
          controller:this.controller,

        }
      )
        .loop(true)
        //自动播放
        .autoPlay(true)
          //视频适配模式
        .objectFit(ImageFit.Contain)
        .height(CommonConstants.HOME_CONTENT_HEIGHT)
        .width(CommonConstants.HOME_CONTENT_WIDTH)

      Column({space:8}){

        Image($r('app.media.head'))
          .width(CommonConstants.HOME_ICON_WIDTH)
          .height(CommonConstants.HOME_ICON_HEIGHT)
          .clip(new Circle({width:40,height:40}))

        Column(){
          Image(
            $r('app.media.ic_praise')
          )
          .width(CommonConstants.HOME_ICON_WIDTH)
          .height(CommonConstants.HOME_ICON_HEIGHT)
          Text(
            this.homeItem.praiseCount.toString()
          )
            .fontColor($r('app.color.color_white'))
            .fontSize(12)
        }
        Column(){
          Image(
            $r('app.media.ic_commit')
          )
            .width(CommonConstants.HOME_ICON_WIDTH)
            .height(CommonConstants.HOME_ICON_HEIGHT)
          Text(
            this.homeItem.commentCount.toString()
          )
            .fontColor($r('app.color.color_white'))
            .fontSize(12)
        }
        Column(){
          Image(
            $r('app.media.ic_collect')
          )
            .width(CommonConstants.HOME_ICON_WIDTH)
            .height(CommonConstants.HOME_ICON_HEIGHT)
          Text(
            this.homeItem.collectCount.toString()
          )
            .fontColor($r('app.color.color_white'))
            .fontSize(12)
        }
        Column(){
          Image(
            $r('app.media.ic_share')
          )
            .width(CommonConstants.HOME_ICON_WIDTH)
            .height(CommonConstants.HOME_ICON_HEIGHT)
          Text(
            this.homeItem.shareCount.toString()
          )
            .fontColor($r('app.color.color_white'))
            .fontSize(12)
        }
      }
      .alignRules(this.BottomEnd)
      .id("column1")
      .margin({bottom:10,right:15})

      Column({space:10}){
        Text("头像")
          .fontColor($r('app.color.color_white'))
          .fontSize(15)
        Text("描述")
          .fontColor($r('app.color.color_white'))
          .fontSize(13)
      }
      .alignItems(HorizontalAlign.Start)
      .align(Alignment.BottomStart)
      .alignRules(this.BottomLeft)
      .id("column2")
      .margin({left:10,bottom:10})
    }
    .height(CommonConstants.HOME_CONTENT_HEIGHT)
    .width(CommonConstants.HOME_CONTENT_WIDTH)
  }
}
