@Observed
export class  HomeItem{
  praiseCount:number=0
  commentCount:number=0
  collectCount:number=0
  shareCount:number=0
  isPlay:boolean=false
  video:Resource=$rawfile('01video.mp4')
  previewUris:Resource =$r('app.media.01videopro')
}

export class TabBarItem {
  id:Number=0;
  name: string ="";
  icon: Resource = $r('app.media.ic_tabs_icon');
  selectIcon: Resource = $r('app.media.ic_tabs_icon_selected');
}


export class MsgItem{
  head:Resource=$r('app.media.head')
  nick:string=''
  msg:string=''

}

@Observed
export class TabItem {
  index: number
  name: string
  icon?: string | Resource

  constructor(index: number, name: string, icon?: string | Resource) {
    this.index = index
    this.name = name
    this.icon = icon
  }
}
