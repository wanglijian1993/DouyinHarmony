import { HomeItem } from '../model/Bean';

export class FriendsShareModel{

  getImages():Array<Resource>{
   let images:Array<Resource>=[]
    for(let i=0;i<15;i++){
      images.push($r(`app.media.ic_image${i%4}`))
    }
   return images

  }

}

let friendsShareModel:FriendsShareModel=new FriendsShareModel()
export default friendsShareModel as FriendsShareModel
