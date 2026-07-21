import { router } from '@kit.ArkUI';
import { ForumStore } from '../model/ForumStore';

@Entry
@Component
struct NewPostPage {
  @State postTitle: string = '';
  @State postContent: string = '';
  @State selectedEmoji: string = '📝';

  publishPost(): void {
    if (this.postTitle.length === 0 && this.postContent.length === 0) {
      return;
    }
    const title = this.postTitle.length > 0 ? this.postTitle : '无题老登瞬间';
    const content = this.postContent.length > 0 ? this.postContent : '这位老登什么都没说……';
    ForumStore.addPost(title, content, this.selectedEmoji);
    this.getUIContext().getRouter().back();
  }

  build() {
    Column() {
      Row() {
        Text('取消')
          .fontSize(16)
          .fontColor('#999999')
          .onClick(() => {
            this.getUIContext().getRouter().back();
          })
        Text('发布动态')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('发布')
          .fontSize(16)
          .fontColor('#FF6B35')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.publishPost();
          })
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .alignItems(VerticalAlign.Center)

      Row() {
        Text('选择心情：')
          .fontSize(14)
          .fontColor('#666666')
        ForEach(['📝', '😂', '😤', '🍵', '🛒', '💪', '🌅', '🧘'], (emoji: string) => {
          Text(emoji)
            .fontSize(28)
            .padding(6)
            .backgroundColor(this.selectedEmoji === emoji ? '#FFF5EE' : '#FFFFFF')
            .borderRadius(8)
            .border({ width: this.selectedEmoji === emoji ? 2 : 0, color: '#FF6B35' })
            .onClick(() => {
              this.selectedEmoji = emoji;
            })
        }, (emoji: string) => emoji)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 8, bottom: 8 })


      TextInput({ placeholder: '给老登瞬间起个标题…', text: this.postTitle })
        .width('100%')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .padding({ left: 16, right: 16 })
        .onChange((value: string) => {
          this.postTitle = value;
        })

      TextArea({ placeholder: '分享你今天遇到的老登精彩瞬间…', text: this.postContent })
        .width('100%')
        .layoutWeight(1)
        .fontSize(16)
        .padding({ left: 16, right: 16, top: 8, bottom: 8 })
        .onChange((value: string) => {
          this.postContent = value;
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}
