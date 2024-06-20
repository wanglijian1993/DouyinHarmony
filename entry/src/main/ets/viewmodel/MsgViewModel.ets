import { when } from '@ohos/hypium';
import { MsgItem } from '../model/Bean'



export class FriendsViewModel{
  nicks:Array<string>=['云端遗梦录','我要月亮奔','星河暗恋记','月野氿桃','星星跌入梦境','桃奈叶子']
  msgs:Array<string>=['奔赴青春','大海星辰','求贤若渴','指鹿为马','梦醒十分','声东击西']
  getName(num:number):string{
    return this.nicks[num%5]
  }

  getMsg(num:number):string{
  return this.msgs[num%5]
  }

   getMsgs():Array<MsgItem>{
     let msgs:Array<MsgItem>=[];

     for(let i=0;i<15;i++){
       let msg=new MsgItem()
       msg.head=$r(`app.media.ic_head${i%5}`)
       msg.nick=this.getName(i)
       msg.msg=this.getMsg(i)
       msgs.push(msg)
     }
    return msgs;
   }
}

let friendsViewModel:FriendsViewModel=new FriendsViewModel()
export default  friendsViewModel as FriendsViewModel