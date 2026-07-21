import { router } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { systemShare } from '@kit.ShareKit';
import { uniformTypeDescriptor as utd } from '@kit.ArkData';
import { QuizData } from '../model/QuizData';
import { LaoDengLevel } from '../model/QuizModel';
import { QuizResultParams } from '../model/RouteParams';

@Entry
@Component
struct ResultPage {
  @State totalScore: number = 0;
  @State level: LaoDengLevel = new LaoDengLevel();
  @State laodengIndex: number = 0;

  aboutToAppear(): void {
    const params = this.getUIContext().getRouter().getParams() as QuizResultParams;
    this.totalScore = params?.totalScore ?? 10;
    this.level = QuizData.calculateLevel(this.totalScore);
    this.laodengIndex = Math.round(this.totalScore / 40 * 100);
  }

  shareResult(): void {
    const shareText = `我的老登指数 ${this.laodengIndex}%！\n等级：${this.level.title} ${this.level.emoji}\n${this.level.description}\n——来自「老登指南」`;
    const shareData = new systemShare.SharedData({
      utd: utd.UniformDataType.PLAIN_TEXT,
      content: shareText,
    });
    const controller = new systemShare.ShareController(shareData);
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    controller.show(context, {
      previewMode: systemShare.SharePreviewMode.DEFAULT,
      selectionMode: systemShare.SelectionMode.SINGLE,
    });
  }

  build() {
    Scroll() {
      Column() {
        Text(this.level.emoji)
          .fontSize(80)
          .margin({ top: 60, bottom: 20 })

        Text('你的老登指数')
          .fontSize(16)
          .fontColor('#999999')

        Text(`${this.laodengIndex}%`)
          .fontSize(64)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF6B35')
          .margin({ top: 8, bottom: 8 })

        Text(this.level.title)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333333')
          .margin({ bottom: 16 })

        Column() {
          Text(this.level.description)
            .fontSize(16)
            .fontColor('#666666')
            .lineHeight(28)
            .textAlign(TextAlign.Center)
        }
        .width('85%')
        .padding(20)
        .backgroundColor('#FFF5EE')
        .borderRadius(16)

        Column() {
          Row() {
            Text('总分: ')
              .fontSize(14)
              .fontColor('#999999')
            Text(`${this.totalScore}`)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF6B35')
            Text(' / 40')
              .fontSize(14)
              .fontColor('#999999')
          }
          .margin({ top: 24 })
        }

        Button('分享给好友')
          .width('80%')
          .height(50)
          .fontSize(18)
          .fontColor('#FFFFFF')
          .backgroundColor('#07C160')
          .borderRadius(25)
          .margin({ top: 32, bottom: 12 })
          .onClick(() => {
            this.shareResult();
          })

        Button('再测一次')
          .width('80%')
          .height(50)
          .fontSize(18)
          .fontColor('#FFFFFF')
          .backgroundColor('#FF6B35')
          .borderRadius(25)
          .margin({ bottom: 12 })
          .onClick(() => {
            this.getUIContext().getRouter().replaceUrl({ url: 'pages/QuizPage' });
          })

        Button('返回首页')
          .width('80%')
          .height(50)
          .fontSize(18)
          .fontColor('#FF6B35')
          .backgroundColor('#FFFFFF')
          .borderRadius(25)
          .border({ width: 2, color: '#FF6B35' })
          .margin({ bottom: 40 })
          .onClick(() => {
            this.getUIContext().getRouter().replaceUrl({ url: 'pages/Index' });
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}
