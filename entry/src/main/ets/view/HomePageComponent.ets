import { CommonConstants } from '../constants/CommonConstants';
import { HomeItem } from '../model/Bean';
import HomeViewModel from '../viewmodel/HomeViewModel';

@Component
export  struct HomePageComponent {
  @State nick:string='';
  @State homeItems:Array<HomeItem>=HomeViewModel.getHomeItems()
  @Prop @Watch('isCurrentPage') homePage:boolean=true
  private  currentIndex:number=0
  private listScroll:ListScroller=new ListScroller()
  private lastIndex:number=0
  isCurrentPage(){
   if(this.homePage){
     this.homeItems[this.currentIndex].isPlay=true
   }else{
     this.homeItems[this.currentIndex].isPlay=false
   }
  }

  build() {
  List({scroller:this.listScroll}){
     ForEach(this.homeItems,(item:HomeItem,index:number)=>{
         HomeViewItem({homeItem:item})
     })
  }

  /**
   * 有子组件划入或划出List显示区域时触发
   * start 开始位置
   * end 偏向上一页或者下一页
   */
  .onScrollIndex((start:number,center:number,end:number)=>{
    this.currentIndex=end
  })
  .onTouch((event: TouchEvent) =>{
    if(event.type == TouchType.Up || event.type == TouchType.Cancel){
      this.homeItems[this.lastIndex].isPlay=false
      this.homeItems[this.currentIndex].isPlay=true
      this.listScroll.scrollToIndex(this.currentIndex,true)
       this.lastIndex=this.currentIndex
    }
    })
  .height(CommonConstants.HOME_CONTENT_HEIGHT)
  .width(CommonConstants.HOME_CONTENT_WIDTH)
  }

}
@Component
struct HomeViewItem{
  @Prop @Watch('isPlay') homeItem:HomeItem;
  controller:VideoController=new VideoController();
   BottomEnd:Record<string,Record<string,string|VerticalAlign|HorizontalAlign>> = {
     'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
     'right': { 'anchor': '__container__', 'align': HorizontalAlign.End }
   }
  BottomLeft:Record<string,Record<string,string|VerticalAlign|HorizontalAlign>> = {
    'bottom': { 'anchor': '__container__', 'align': VerticalAlign.Bottom },
    'left': { 'anchor': '__container__', 'align': HorizontalAlign.Start }
  }

  isPlay(){
    if(this.homeItem.isPlay){
      this.controller.start()
    }else{
      this.controller.pause()
    }
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
          //视频适配模式
        .autoPlay(this.homeItem.isPlay)
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
