import { ForumStore } from '../model/ForumStore';
import { ForumPost, Comment } from '../model/ForumData';
import { PostDetailParams } from '../model/RouteParams';

@Entry
@Component
struct PostDetailPage {
  @State post: ForumPost = new ForumPost();
  @State commentList: Comment[] = [];
  @State commentText: string = '';

  aboutToAppear(): void {
    const params = this.getUIContext().getRouter().getParams() as PostDetailParams;
    const postId = params?.postId ?? '';
    const found = ForumStore.getPostById(postId);
    if (found !== undefined) {
      this.post = found;
    }
    this.commentList = ForumStore.getCommentsByPostId(postId);
  }

  submitComment(): void {
    if (this.commentText.length === 0) {
      return;
    }
    ForumStore.addComment(this.post.id, this.commentText);
    this.commentList = ForumStore.getCommentsByPostId(this.post.id);
    const updated = ForumStore.getPostById(this.post.id);
    if (updated !== undefined) {
      this.post = new ForumPost();
      this.post = updated;
    }
    this.commentText = '';
  }

  toggleLike(): void {
    ForumStore.toggleLike(this.post.id);
    const updated = ForumStore.getPostById(this.post.id);
    if (updated !== undefined) {
      this.post = new ForumPost();
      this.post = updated;
    }
  }

  build() {
    Column() {
      Row() {
        Text('< 返回')
          .fontSize(16)
          .fontColor('#FF6B35')
          .onClick(() => {
            this.getUIContext().getRouter().back();
          })
        Text('帖子详情')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('  ')
          .width(50)
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .alignItems(VerticalAlign.Center)
      .backgroundColor('#FFFFFF')

      Scroll() {
        Column() {
          Row() {
            Text(this.post.avatar)
              .fontSize(36)
            Column() {
              Text(this.post.author)
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
              Text(this.post.timestamp)
                .fontSize(12)
                .fontColor('#999999')
                .margin({ top: 4 })
            }
            .alignItems(HorizontalAlign.Start)
            .margin({ left: 12 })
          }
          .width('100%')
          .padding({ left: 16, right: 16, top: 16, bottom: 8 })

          Text(this.post.title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 16, right: 16 })

          Text(this.post.content)
            .fontSize(16)
            .fontColor('#666666')
            .lineHeight(26)
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 16, right: 16, top: 12, bottom: 16 })

          Divider()
            .margin({ left: 16, right: 16 })

          Row() {
            Row() {
              Text(this.post.liked ? '❤️' : '👍')
                .fontSize(20)
              Text(`${this.post.likes}`)
                .fontSize(14)
                 .fontColor(this.post.liked ? '#FF6B35' : '#666666')
                .margin({ left: 4 })
            }
            .margin({ right: 32 })
            .onClick(() => {
              this.toggleLike();
            })

            Row() {
              Text('💬')
                .fontSize(20)
               Text(`${this.post.comments}`)
                 .fontSize(14)
                 .fontColor('#666666')
                .margin({ left: 4 })
            }
          }
          .width('100%')
          .padding(16)

          Divider()
            .margin({ left: 16, right: 16 })

          Text(`评论 (${this.commentList.length})`)
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 16, top: 16, bottom: 8 })

          if (this.commentList.length === 0) {
            Text('暂无评论，快来抢沙发！')
              .fontSize(14)
              .fontColor('#888888')
              .margin({ top: 24, bottom: 24 })
          } else {
            ForEach(this.commentList, (comment: Comment) => {
              Row() {
                Text(comment.avatar)
                  .fontSize(28)
                Column() {
                  Row() {
                    Text(comment.author)
                      .fontSize(14)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#333333')
               Text(comment.timestamp)
                 .fontSize(12)
                 .fontColor('#888888')
                      .margin({ left: 8 })
                  }
                  Text(comment.content)
                    .fontSize(14)
                    .fontColor('#666666')
                    .margin({ top: 4 })
                }
                .layoutWeight(1)
                .margin({ left: 8 })
                .alignItems(HorizontalAlign.Start)
              }
              .width('100%')
              .padding({ left: 16, right: 16, top: 10, bottom: 10 })
              .alignItems(VerticalAlign.Top)
            }, (comment: Comment) => comment.id)
          }
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .padding({ bottom: 16 })
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .edgeEffect(EdgeEffect.Spring)

      Divider()

      Row() {
        TextInput({ placeholder: '说点什么…', text: this.commentText })
          .layoutWeight(1)
          .height(40)
          .fontSize(14)
          .backgroundColor('#F5F5F5')
          .borderRadius(20)
          .padding({ left: 16, right: 16 })
          .onChange((value: string) => {
            this.commentText = value;
          })
        Button('发送')
          .height(36)
          .fontSize(14)
          .fontColor('#FFFFFF')
          .backgroundColor(this.commentText.length > 0 ? '#FF6B35' : '#CCCCCC')
          .borderRadius(18)
          .margin({ left: 8 })
          .enabled(this.commentText.length > 0)
          .onClick(() => {
            this.submitComment();
          })
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 8, bottom: 8 })
      .backgroundColor('#FFFFFF')
      .alignItems(VerticalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}
