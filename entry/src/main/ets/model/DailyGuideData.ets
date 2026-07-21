export class DailyTip {
  id: string = '';
  title: string = '';
  content: string = '';
  emoji: string = '';
  category: string = '';

  static of(id: string, title: string, content: string, emoji: string, category: string): DailyTip {
    const t = new DailyTip();
    t.id = id;
    t.title = title;
    t.content = content;
    t.emoji = emoji;
    t.category = category;
    return t;
  }
}

export class DailyGuideData {
  static getTips(): DailyTip[] {
    return [
      DailyTip.of('1', '保温杯的正确打开方式', '枸杞要用温水泡，开水会破坏营养。但老登们都知道，烫嘴才是灵魂。', '🍵', '养生'),
      DailyTip.of('2', '朋友圈养生文鉴别指南', '标题带"震惊"的，80%是假的。但转发给子女的时候，别告诉他们你已经知道了。', '📱', '社交'),
      DailyTip.of('3', '早起的鸟儿有虫吃', '但早起的虫儿被鸟吃。所以6点起还是8点起，取决于你觉得自己是鸟还是虫。老登一般4点就醒了。', '🌅', '作息'),
      DailyTip.of('4', '超市打折生存手册', '看到"买一送一"先冷静——你真的需要两箱酱油吗？需要。当然需要。', '🛒', '生活'),
      DailyTip.of('5', '与年轻人沟通的正确姿势', '他们说的"6"不是数字，"YYDS"不是拼音缩写。听不懂就点头微笑，保持老登的体面。', '🤝', '社交'),
      DailyTip.of('6', '膝盖养护必修课', '爬楼梯伤膝盖？那就不爬。坐电梯伤自尊？那就假装在锻炼心肺。', '🦵', '养生'),
      DailyTip.of('7', '手机省电终极奥义', '关蓝牙、关定位、降亮度……省下来的电，刚好够你看完这篇养生文。', '🔋', '生活'),
      DailyTip.of('8', '广场舞社交潜规则', '第一排是大佬，第二排是核心，最后一排是刚来的。别站错位。', '💃', '社交'),
      DailyTip.of('9', '睡前泡脚的科学依据', '42°C水温，20分钟，水面没过脚踝。这不是养生，这是仪式感。', '🦶', '养生'),
      DailyTip.of('10', '老登的自我修养', '接受自己看不懂潮流、听不懂新歌、跟不上节奏的事实——然后继续泡你的枸杞。', '🧘', '心态'),
    ];
  }

  static getTodayTip(): DailyTip {
    const tips = DailyGuideData.getTips();
    const dayOfYear = DailyGuideData.getDayOfYear();
    const index = dayOfYear % tips.length;
    return tips[index];
  }

  static getDayOfYear(): number {
    const now = new Date();
    const start = new Date(now.getFullYear(), 0, 0);
    const diff = now.getTime() - start.getTime();
    return Math.floor(diff / (1000 * 60 * 60 * 24));
  }
}
