import { router } from '@kit.ArkUI';
import { QuizData } from '../model/QuizData';
import { QuizQuestion, QuizOption } from '../model/QuizModel';
import { QuizResultParams } from '../model/RouteParams';

@Entry
@Component
struct QuizPage {
  @State currentIndex: number = 0;
  @State totalScore: number = 0;
  @State selectedIndex: number = -1;
  @State questions: QuizQuestion[] = [];
  @State progress: number = 0;

  aboutToAppear(): void {
    this.questions = QuizData.getRandomQuestions(10);
    this.progress = 1 / this.questions.length;
  }

  selectOption(option: QuizOption, optIndex: number): void {
    this.selectedIndex = optIndex;
    this.totalScore += option.score;
  }

  goNext(): void {
    if (this.currentIndex < this.questions.length - 1) {
      this.currentIndex += 1;
      this.selectedIndex = -1;
      this.progress = (this.currentIndex + 1) / this.questions.length;
    } else {
      const p: QuizResultParams = { totalScore: this.totalScore };
      this.getUIContext().getRouter().pushUrl({ url: 'pages/ResultPage', params: p });
    }
  }

  build() {
    Column() {
      Row() {
        Progress({ value: this.progress, total: 1, type: ProgressType.Linear })
          .width('100%')
          .color('#FF6B35')
          .backgroundColor('#EEEEEE')
          .borderRadius(10)
      }
      .padding({ left: 24, right: 24, top: 12 })

      Text(`${this.currentIndex + 1} / ${this.questions.length}`)
        .fontSize(14)
        .fontColor('#666666')
        .margin({ top: 8 })

      if (this.questions.length > 0) {
        Column() {
          Text(this.questions[this.currentIndex].title)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')
            .textAlign(TextAlign.Center)
            .margin({ top: 40, bottom: 40 })

          ForEach(this.questions[this.currentIndex].options, (option: QuizOption, optIndex: number) => {
            Row() {
              Text(option.text)
                .fontSize(16)
                .fontColor(this.selectedIndex === optIndex ? '#FFFFFF' : '#333333')
            }
            .width('100%')
            .padding({ left: 20, right: 20, top: 16, bottom: 16 })
            .backgroundColor(this.selectedIndex === optIndex ? '#FF6B35' : '#F5F5F5')
            .borderRadius(12)
            .margin({ bottom: 12 })
            .onClick(() => {
              this.selectOption(option, optIndex);
            })
          }, (option: QuizOption, optIndex: number) => `${this.currentIndex}_${optIndex}`)
        }
        .width('100%')
        .padding({ left: 24, right: 24 })
      }

      Blank()

      Button(this.selectedIndex === -1 ? '请选择一个选项' : (this.currentIndex < this.questions.length - 1 ? '下一题' : '查看结果'))
        .width('80%')
        .height(50)
        .fontSize(18)
        .fontColor('#FFFFFF')
        .backgroundColor(this.selectedIndex === -1 ? '#CCCCCC' : '#FF6B35')
        .borderRadius(25)
        .enabled(this.selectedIndex !== -1)
        .margin({ bottom: 40 })
        .onClick(() => {
          this.goNext();
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}
