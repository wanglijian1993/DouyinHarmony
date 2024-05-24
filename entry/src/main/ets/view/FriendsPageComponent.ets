@Component
export struct FriendsPageComponent {
  @State nick:string='';


  build() {
    Text(
      this.nick
    )

  }
}
