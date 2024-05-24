import { CommonConstants } from '../constants/CommonConstants';
import { HomeItem } from '../model/Bean';

export class HomeViewModel{
   getHomeItems():Array<HomeItem>{
     let homeItems:Array<HomeItem>=[]
     for(let i=0;i<CommonConstants.HOME_PAGE_SIZE;i++){
       let homeItem= new HomeItem()
       homeItem.praiseCount=99
       homeItem.commentCount=99
       homeItem.shareCount=99
       homeItem.collectCount=99
       if(i%2==0){
         homeItem.video=$rawfile('01video.mp4')
         homeItem.previewUris=$r('app.media.01videopro')
       }else{
         homeItem.video=$rawfile('02video.mp4')
         homeItem.previewUris=$r('app.media.02videopro')
       }
       homeItems.push(homeItem)
     }
     return homeItems
  }


}
let homeViewModel=new HomeViewModel();
export default homeViewModel as HomeViewModel;