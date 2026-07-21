import { QuizOption, QuizQuestion, LaoDengLevel } from './QuizModel';

export class QuizData {
  static getAllQuestions(): QuizQuestion[] {
    return [
      QuizQuestion.of('q1', '早上醒来第一件事是？', [
        QuizOption.of('刷社交媒体', 1),
        QuizOption.of('看新闻/股票', 2),
        QuizOption.of('泡一杯茶或咖啡', 3),
        QuizOption.of('量血压/测血糖', 4),
      ]),
      QuizQuestion.of('q2', '你手机字体大小是？', [
        QuizOption.of('默认大小', 1),
        QuizOption.of('稍微调大了一点', 2),
        QuizOption.of('调到特大号', 3),
        QuizOption.of('什么？我看不清选项', 4),
      ]),
      QuizQuestion.of('q3', '朋友圈最常发什么？', [
        QuizOption.of('自拍/美食/旅行', 1),
        QuizOption.of('心灵鸡汤/励志语录', 2),
        QuizOption.of('养生文章/健康提醒', 3),
        QuizOption.of('已经不会发朋友圈了', 4),
      ]),
      QuizQuestion.of('q4', '出去吃饭首选？', [
        QuizOption.of('网红餐厅打卡', 1),
        QuizOption.of('朋友推荐的馆子', 2),
        QuizOption.of('老字号/家常菜馆', 3),
        QuizOption.of('带保温杯去哪都行', 4),
      ]),
      QuizQuestion.of('q5', '晚上几点睡？', [
        QuizOption.of('12点以后', 1),
        QuizOption.of('11点左右', 2),
        QuizOption.of('10点准时', 3),
        QuizOption.of('9点？你问我几点起？', 4),
      ]),
      QuizQuestion.of('q6', '看到年轻人熬夜你的反应？', [
        QuizOption.of('年轻就是要折腾', 1),
        QuizOption.of('有点担心但不说', 2),
        QuizOption.of('忍不住劝一句早点睡', 3),
        QuizOption.of('直接转发养生文到群里', 4),
      ]),
      QuizQuestion.of('q7', '你的保温杯里泡什么？', [
        QuizOption.of('不用保温杯', 1),
        QuizOption.of('白开水/茶', 2),
        QuizOption.of('枸杞/红枣', 3),
        QuizOption.of('枸杞+黄芪+当归+西洋参', 4),
      ]),
      QuizQuestion.of('q8', '听到新歌你的反应？', [
        QuizOption.of('马上学唱', 1),
        QuizOption.of('还行，听听看', 2),
        QuizOption.of('还是老歌好听', 3),
        QuizOption.of('现在年轻人的歌听不懂', 4),
      ]),
      QuizQuestion.of('q9', '身体不舒服怎么办？', [
        QuizOption.of('扛一扛就过去了', 1),
        QuizOption.of('上网查一下症状', 2),
        QuizOption.of('预约挂号去医院', 3),
        QuizOption.of('翻出家庭药箱自行诊断', 4),
      ]),
      QuizQuestion.of('q10', '对「老登」这个词什么感觉？', [
        QuizOption.of('啥意思？不懂', 1),
        QuizOption.of('跟我没关系', 2),
        QuizOption.of('说的可能是我', 3),
        QuizOption.of('我就是老登本人', 4),
      ]),
      QuizQuestion.of('q11', '去旅游更倾向？', [
        QuizOption.of('极限运动/蹦极潜水', 1),
        QuizOption.of('打卡网红景点', 2),
        QuizOption.of('跟团游省心省力', 3),
        QuizOption.of('在家就是最好的旅行', 4),
      ]),
      QuizQuestion.of('q12', '双十一买什么？', [
        QuizOption.of('潮牌/数码/游戏', 1),
        QuizOption.of('看心情随便买', 2),
        QuizOption.of('囤日用品和保健品', 3),
        QuizOption.of('不知道双十一是啥', 4),
      ]),
      QuizQuestion.of('q13', '你用什么聊天软件？', [
        QuizOption.of('各种新APP都试试', 1),
        QuizOption.of('微信就够了', 2),
        QuizOption.of('微信群只看不说话', 3),
        QuizOption.of('打电话比较直接', 4),
      ]),
      QuizQuestion.of('q14', '对「内卷」这个词的理解？', [
        QuizOption.of('深有体会天天卷', 1),
        QuizOption.of('大概知道啥意思', 2),
        QuizOption.of('听说但不太懂', 3),
        QuizOption.of('啥是内卷？卷帘门吗？', 4),
      ]),
      QuizQuestion.of('q15', '你的运动方式？', [
        QuizOption.of('健身房撸铁', 1),
        QuizOption.of('跑步/游泳', 2),
        QuizOption.of('散步/太极拳', 3),
        QuizOption.of('躺在床上深呼吸', 4),
      ]),
      QuizQuestion.of('q16', '收到微信红包怎么回？', [
        QuizOption.of('秒抢然后发回去', 1),
        QuizOption.of('点开看看多少', 2),
        QuizOption.of('犹豫一下再点', 3),
        QuizOption.of('什么红包？我手机在震动？', 4),
      ]),
      QuizQuestion.of('q17', '看电视的习惯？', [
        QuizOption.of('追综艺/网剧', 1),
        QuizOption.of('偶尔看部电影', 2),
        QuizOption.of('看新闻联播和天气预报', 3),
        QuizOption.of('只会用遥控器开关机', 4),
      ]),
      QuizQuestion.of('q18', '聚会时你在干嘛？', [
        QuizOption.of('全场焦点活跃气氛', 1),
        QuizOption.of('和熟人聊天', 2),
        QuizOption.of('默默吃饭偶尔附和', 3),
        QuizOption.of('根本没被邀请聚会', 4),
      ]),
      QuizQuestion.of('q19', '穿衣风格？', [
        QuizOption.of('紧跟潮流穿搭', 1),
        QuizOption.of('干净整洁就行', 2),
        QuizOption.of('舒适宽松为主', 3),
        QuizOption.of('同款买五件换着穿', 4),
      ]),
      QuizQuestion.of('q20', '你的口头禅是？', [
        QuizOption.of('YYDS/绝绝子', 1),
        QuizOption.of('还行吧/差不多', 2),
        QuizOption.of('注意身体/早点休息', 3),
        QuizOption.of('想当年我们那时候…', 4),
      ]),
      QuizQuestion.of('q21', '雨天你最想做的事？', [
        QuizOption.of('拍照发朋友圈', 1),
        QuizOption.of('窝在沙发看剧', 2),
        QuizOption.of('泡杯茶听雨声', 3),
        QuizOption.of('担心衣服晾不干', 4),
      ]),
      QuizQuestion.of('q22', '你的闹钟设几个？', [
        QuizOption.of('一个就够了', 1),
        QuizOption.of('两三个保险', 2),
        QuizOption.of('五个起步', 3),
        QuizOption.of('不需要闹钟，生物钟比闹钟准', 4),
      ]),
      QuizQuestion.of('q23', '遇到新技术你的态度？', [
        QuizOption.of('第一时间体验', 1),
        QuizOption.of('看别人用再决定', 2),
        QuizOption.of('能不用就不用', 3),
        QuizOption.of('年轻人帮我弄一下', 4),
      ]),
      QuizQuestion.of('q24', '过年最期待什么？', [
        QuizOption.of('和朋友出去玩', 1),
        QuizOption.of('抢红包', 2),
        QuizOption.of('一家人团聚吃饭', 3),
        QuizOption.of('可以名正言顺早睡', 4),
      ]),
      QuizQuestion.of('q25', '你有多少个微信群？', [
        QuizOption.of('5个以下精简社交', 1),
        QuizOption.of('5-10个正常范围', 2),
        QuizOption.of('10-20个消息看不完', 3),
        QuizOption.of('20个以上全是养生群', 4),
      ]),
      QuizQuestion.of('q26', '对「元宇宙」你了解多少？', [
        QuizOption.of('深入研究过', 1),
        QuizOption.of('听说过概念', 2),
        QuizOption.of('以为是个游戏', 3),
        QuizOption.of('宇宙就宇宙还元宇宙？', 4),
      ]),
      QuizQuestion.of('q27', '你的理发频率？', [
        QuizOption.of('两周一次造型', 1),
        QuizOption.of('一个月一次', 2),
        QuizOption.of('长了就剪不记时间', 3),
        QuizOption.of('理发？我用剃须刀自己搞定', 4),
      ]),
      QuizQuestion.of('q28', '坐电梯时你？', [
        QuizOption.of('刷手机', 1),
        QuizOption.of('看楼层数字', 2),
        QuizOption.of('跟邻居打招呼', 3),
        QuizOption.of('讨论天气和菜价', 4),
      ]),
      QuizQuestion.of('q29', '你的午休方式？', [
        QuizOption.of('不午休精力充沛', 1),
        QuizOption.of('眯一会儿', 2),
        QuizOption.of('必须躺下睡半小时', 3),
        QuizOption.of('午休？我从早睡到午', 4),
      ]),
      QuizQuestion.of('q30', '对AI的看法？', [
        QuizOption.of('已经在用了很方便', 1),
        QuizOption.of('知道但不太用', 2),
        QuizOption.of('担心会取代人类', 3),
        QuizOption.of('AI是啥？爱？', 4),
      ]),
    ];
  }

  static getRandomQuestions(count: number): QuizQuestion[] {
    const all = QuizData.getAllQuestions();
    const shuffled: QuizQuestion[] = [];
    for (let i = 0; i < all.length; i++) {
      shuffled.push(all[i]);
    }
    for (let i = shuffled.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      const temp = shuffled[i];
      shuffled[i] = shuffled[j];
      shuffled[j] = temp;
    }
    const result: QuizQuestion[] = [];
    const len = count < shuffled.length ? count : shuffled.length;
    for (let i = 0; i < len; i++) {
      result.push(shuffled[i]);
    }
    return result;
  }

  static getLevels(): LaoDengLevel[] {
    return [
      LaoDengLevel.of(10, 15, '精神小伙', '😎', '你还年轻！老登这个词跟你八竿子打不着，继续浪吧！'),
      LaoDengLevel.of(16, 22, '预备老登', '🤔', '已经出现老登苗头了，注意防范，还有救！'),
      LaoDengLevel.of(23, 30, '标准老登', '🍵', '恭喜你！已经是标准老登了，保温杯准备好了吗？'),
      LaoDengLevel.of(31, 40, '登峰造极', '🏔️', '老登中的战斗机！你的存在就是对老登文化的最好诠释！'),
    ];
  }

  static calculateLevel(score: number): LaoDengLevel {
    const levels = QuizData.getLevels();
    for (let i = 0; i < levels.length; i++) {
      if (score >= levels[i].minScore && score <= levels[i].maxScore) {
        return levels[i];
      }
    }
    return levels[0];
  }
}
