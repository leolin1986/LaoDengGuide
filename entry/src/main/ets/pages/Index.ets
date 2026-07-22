import { router } from '@kit.ArkUI';
import { DailyGuideData } from '../model/DailyGuideData';
import { DailyTip } from '../model/DailyGuideData';
import { ForumPost } from '../model/ForumData';
import { ForumStore } from '../model/ForumStore';
import { PostDetailParams } from '../model/RouteParams';

@Entry
@Component
struct Index {
  @State currentTab: number = 0;
  @State todayTip: DailyTip = new DailyTip();
  @State allTips: DailyTip[] = [];
  @State posts: ForumPost[] = [];

  aboutToAppear(): void {
    this.todayTip = DailyGuideData.getTodayTip();
    this.allTips = DailyGuideData.getTips();
    this.posts = ForumStore.getAllPosts();
  }

  onPageShow(): void {
    this.posts = ForumStore.getAllPosts();
  }

  @Builder
  QuizTab() {
    Column() {
      Text('🍵')
        .fontSize(80)
        .margin({ top: 80 })

      Text('老登指南')
        .fontSize(36)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333333')
        .margin({ top: 12 })

      Text('测测你的「老登指数」')
        .fontSize(18)
        .fontColor('#666666')
        .margin({ top: 8 })

      Text('你离成为老登还有多远？\n回答10个灵魂拷问，真相即将揭晓！')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .lineHeight(24)
        .margin({ top: 20 })

      Blank()

      Button('开始测试')
        .width('80%')
        .height(56)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#FFFFFF')
        .backgroundColor('#FF6B35')
        .borderRadius(28)
        .margin({ bottom: 60 })
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/QuizPage' });
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .alignItems(HorizontalAlign.Center)
  }

  @Builder
  GuideTab() {
    Scroll() {
      Column() {
        Column() {
          Text('📖 今日指南')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .margin({ bottom: 16 })

          Row() {
            Text(this.todayTip.emoji)
              .fontSize(40)
            Column() {
              Text(this.todayTip.title)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
              Text(this.todayTip.content)
                .fontSize(14)
                .fontColor('#666666')
                .lineHeight(22)
                .margin({ top: 8 })
            }
            .layoutWeight(1)
            .margin({ left: 12 })
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFF5EE')
        .borderRadius(16)
        .margin({ top: 16, left: 16, right: 16 })

        Text('📜 全部指南')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .margin({ top: 24, left: 16 })

        ForEach(this.allTips, (tip: DailyTip) => {
          Row() {
            Text(tip.emoji)
              .fontSize(32)
            Column() {
              Row() {
                Text(tip.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#333333')
                  .layoutWeight(1)
                Text(tip.category)
                  .fontSize(12)
                  .fontColor('#FF6B35')
                  .padding({ left: 8, right: 8, top: 2, bottom: 2 })
                  .backgroundColor('#FFF5EE')
                  .borderRadius(10)
              }
              Text(tip.content)
                .fontSize(13)
                .fontColor('#666666')
                .lineHeight(20)
                .margin({ top: 6 })
                .maxLines(2)
                .textOverflow({ overflow: TextOverflow.Ellipsis })
            }
            .layoutWeight(1)
            .margin({ left: 12 })
            .alignItems(HorizontalAlign.Start)
          }
          .width('100%')
          .padding(16)
          .backgroundColor('#FFFFFF')
          .borderRadius(12)
          .margin({ top: 8, left: 16, right: 16 })
          .shadow({ radius: 2, color: '#10000000', offsetY: 1 })
        }, (tip: DailyTip) => tip.id)
      }
      .padding({ bottom: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .edgeEffect(EdgeEffect.Spring)
  }

  @Builder
  ForumTab() {
    Column() {
      List({ space: 8 }) {
        ForEach(this.posts, (post: ForumPost) => {
          ListItem() {
            Row() {
              Text(post.avatar)
                .fontSize(36)
              Column() {
                Row() {
                  Text(post.author)
                    .fontSize(14)
                    .fontWeight(FontWeight.Bold)
                    .fontColor('#333333')
                  Text(post.timestamp)
                    .fontSize(12)
                    .fontColor('#888888')
                    .margin({ left: 8 })
                }
                Text(post.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#333333')
                  .margin({ top: 6 })
                Text(post.content)
                  .fontSize(13)
                  .fontColor('#666666')
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                  .margin({ top: 4 })

                Row() {
                  Text(`👍 ${post.likes}`)
                    .fontSize(12)
                    .fontColor('#666666')
                  Text(`💬 ${post.comments}`)
                    .fontSize(12)
                    .fontColor('#666666')
                    .margin({ left: 16 })
                }
                .margin({ top: 8 })
              }
              .layoutWeight(1)
              .margin({ left: 12 })
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .padding(16)
            .backgroundColor('#FFFFFF')
            .borderRadius(12)
            .margin({ left: 16, right: 16 })
            .shadow({ radius: 2, color: '#10000000', offsetY: 1 })
            .onClick(() => {
              const p: PostDetailParams = { postId: post.id };
              this.getUIContext().getRouter().pushUrl({ url: 'pages/PostDetailPage', params: p });
            })
          }
        }, (post: ForumPost) => post.id)
      }
      .layoutWeight(1)
      .margin({ top: 8 })
      .edgeEffect(EdgeEffect.Spring)

      Button('✏️ 发个动态')
        .width('90%')
        .height(48)
        .fontSize(16)
        .fontColor('#FFFFFF')
        .backgroundColor('#FF6B35')
        .borderRadius(24)
        .margin({ bottom: 12 })
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/NewPostPage' });
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          this.QuizTab()
        }.tabBar('自测')

        TabContent() {
          this.GuideTab()
        }.tabBar('指南')

        TabContent() {
          this.ForumTab()
        }.tabBar('广场')
      }
      .onChange((index: number) => {
        this.currentTab = index;
      })
    }
    .width('100%')
    .height('100%')
  }
}
