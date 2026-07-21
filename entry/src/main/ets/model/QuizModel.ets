export class QuizOption {
  text: string = '';
  score: number = 0;

  static of(text: string, score: number): QuizOption {
    const o = new QuizOption();
    o.text = text;
    o.score = score;
    return o;
  }
}

export class QuizQuestion {
  id: string = '';
  title: string = '';
  options: QuizOption[] = [];

  static of(id: string, title: string, options: QuizOption[]): QuizQuestion {
    const q = new QuizQuestion();
    q.id = id;
    q.title = title;
    q.options = options;
    return q;
  }
}

export class LaoDengLevel {
  minScore: number = 0;
  maxScore: number = 0;
  title: string = '';
  emoji: string = '';
  description: string = '';

  static of(minScore: number, maxScore: number, title: string, emoji: string, description: string): LaoDengLevel {
    const l = new LaoDengLevel();
    l.minScore = minScore;
    l.maxScore = maxScore;
    l.title = title;
    l.emoji = emoji;
    l.description = description;
    return l;
  }
}
