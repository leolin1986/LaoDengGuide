export class ForumPost {
  id: string = '';
  author: string = '';
  avatar: string = '';
  title: string = '';
  content: string = '';
  emoji: string = '';
  likes: number = 0;
  comments: number = 0;
  timestamp: string = '';
  liked: boolean = false;

  static of(id: string, author: string, avatar: string, title: string, content: string,
    emoji: string, likes: number, comments: number, timestamp: string): ForumPost {
    const p = new ForumPost();
    p.id = id;
    p.author = author;
    p.avatar = avatar;
    p.title = title;
    p.content = content;
    p.emoji = emoji;
    p.likes = likes;
    p.comments = comments;
    p.timestamp = timestamp;
    return p;
  }
}

export class Comment {
  id: string = '';
  postId: string = '';
  author: string = '';
  avatar: string = '';
  content: string = '';
  timestamp: string = '';

  static of(id: string, postId: string, author: string, avatar: string, content: string, timestamp: string): Comment {
    const c = new Comment();
    c.id = id;
    c.postId = postId;
    c.author = author;
    c.avatar = avatar;
    c.content = content;
    c.timestamp = timestamp;
    return c;
  }
}

export class ForumData {
  static getPosts(): ForumPost[] {
    return [
      ForumPost.of('1', '老王', '👴', '今天在超市排队，前面的老哥买了8箱酱油', '买一送一他直接搬空了货架，收银员看他的眼神都变了。我默默放下了手里的2箱……', '🛒', 128, 32, '2小时前'),
      ForumPost.of('2', '铁柱他爹', '🧔', '儿子说YYDS，我以为他在骂人', '我问他啥意思，他说"永远的神"。我说你爹才是神，他翻了个白眼走了。', '😤', 256, 67, '3小时前'),
      ForumPost.of('3', '保温杯战士', '🥤', '保温杯里泡了六种东西，喝了一口直接升天', '枸杞+黄芪+当归+西洋参+红枣+桂圆，喝完觉得能再活500年。就是杯子太重了。', '🍵', 512, 89, '5小时前'),
      ForumPost.of('4', '广场舞女王', '💃', '今天广场舞争霸赛，我们队拿了第一', '凤凰传奇的新歌，我们提前三天就开始练了。隔壁队伍直接看傻了。', '🏆', 342, 45, '6小时前'),
      ForumPost.of('5', '退休老李', '🎣', '钓鱼钓到一条鱼，结果老伴说今天吃素', '沉默了五秒，我又把鱼放回去了。老登的生存智慧。', '🐟', 678, 123, '8小时前'),
      ForumPost.of('6', '手机达人老张', '📱', '终于学会发表情包了，一发就是20个', '儿女群现在已经没人说话了，都是我一个人在发表情包。这叫什么？这叫刷屏。', '😎', 198, 56, '10小时前'),
      ForumPost.of('7', '早起冠军', '🌅', '4点醒了，全小区都是我的', '5点遛弯，6点吃早饭，7点开始想中午吃什么。老登的一天比年轻人长多了。', '⚡', 445, 78, '12小时前'),
      ForumPost.of('8', '老登观察员', '🔍', '在公园长椅上坐了一下午，观察了23个老登', '研究结果：90%手持保温杯，75%穿运动鞋，60%在聊养生，100%很快乐。', '📊', 889, 201, '昨天'),
    ];
  }

  static getComments(): Comment[] {
    return [
      Comment.of('1', '1', '退休老李', '🎣', '8箱酱油…这老哥是要开饭店吗', '1小时前'),
      Comment.of('2', '1', '广场舞女王', '💃', '买一送一不买才是亏！我上次搬了10箱醋', '1小时前'),
      Comment.of('3', '2', '保温杯战士', '🥤', 'YYDS我还以为是"也要打伞"', '2小时前'),
      Comment.of('4', '2', '老王', '👴', '我儿子说绝绝子，我以为他在夸我做饭好吃', '2小时前'),
      Comment.of('5', '3', '早起冠军', '🌅', '六种？我最多泡三种，你这是炼丹啊', '4小时前'),
      Comment.of('6', '3', '退休老李', '🎣', '加个冬虫夏草效果更好，别问我怎么知道的', '4小时前'),
      Comment.of('7', '5', '老登观察员', '🔍', '这就是老登的最高境界：识时务者为俊杰', '7小时前'),
      Comment.of('8', '8', '保温杯战士', '🥤', '100%很快乐这个数据太真实了', '昨天'),
      Comment.of('9', '8', '铁柱他爹', '🧔', '75%穿运动鞋…我的鞋柜全是运动鞋', '昨天'),
    ];
  }
}
