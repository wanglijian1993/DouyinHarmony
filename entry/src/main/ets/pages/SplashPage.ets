import { router } from '@kit.ArkUI'

@Entry
@Component
struct Splash{

  aboutToAppear(): void {
   setTimeout(()=>{

     router.replaceUrl({ url: 'pages/Index'})
   },2000)
  }


  build() {
    Stack(){
      Image($r('app.media.splash'))
    } .width("100%").height("100%").backgroundColor($r("app.color.color_white")).alignContent(Alignment.Center)


  }

}