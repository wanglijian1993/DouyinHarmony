
import ImageModes from '../viewmodel/ImagesModel'
@Preview
@Component
export struct ImagesPageComponent {
  @State nick:string='';
  @State images:Array<Resource>=ImageModes.getImages()
  @State egDivider: DividerTmp = new DividerTmp(1, 60, 10, '#ffe9f0f0')
  build() {
    Column(){
      List(){
        ForEach(this.images,(item: Resource, index: number)=>{
          ListItem(){
            Image(item)
              .height(200)
              .width('100%')
          }

        })
      }
      .listDirection(Axis.Vertical)
      .divider(this.egDivider)
    }
  }
}

class DividerTmp {
  strokeWidth: Length = 1
  startMargin: Length = 60
  endMargin: Length = 10
  color: ResourceColor = '#ffe9f0f0'

  constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
    this.strokeWidth = strokeWidth
    this.startMargin = startMargin
    this.endMargin = endMargin
    this.color = color
  }
}