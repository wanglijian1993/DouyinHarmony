import { MsgItem } from '../model/Bean'

export class FriendsViewModel{

   getMsgs():Array<MsgItem>{
     let msgs:Array<MsgItem>=[];

     for(let i=0;i<10;i++){
       let msg=new MsgItem()
       msg.head=$r('app.media.head')
       msg.nick='名称:'+i
       msg.msg='暂无消息'+i
       msgs.push(msg)
     }
    return msgs;
   }


}

let friendsViewModel:FriendsViewModel=new FriendsViewModel()
export default  friendsViewModel as FriendsViewModel