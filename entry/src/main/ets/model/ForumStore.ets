import { ForumPost, Comment } from './ForumData';
import { ForumData } from './ForumData';

export class ForumStore {
  static posts: ForumPost[] = ForumData.getPosts();
  static nextId: number = ForumStore.posts.length + 1;
  static comments: Comment[] = ForumData.getComments();
  static nextCommentId: number = ForumStore.comments.length + 1;

  static addPost(title: string, content: string, emoji: string): void {
    const post = new ForumPost();
    post.id = `${ForumStore.nextId}`;
    post.author = '匿名老登';
    post.avatar = emoji;
    post.title = title;
    post.content = content;
    post.emoji = emoji;
    post.likes = 0;
    post.comments = 0;
    post.timestamp = '刚刚';
    ForumStore.nextId++;
    const newPosts: ForumPost[] = [post];
    for (let i = 0; i < ForumStore.posts.length; i++) {
      newPosts.push(ForumStore.posts[i]);
    }
    ForumStore.posts = newPosts;
  }

  static getAllPosts(): ForumPost[] {
    return ForumStore.posts;
  }

  static getPostById(id: string): ForumPost | undefined {
    for (let i = 0; i < ForumStore.posts.length; i++) {
      if (ForumStore.posts[i].id === id) {
        return ForumStore.posts[i];
      }
    }
    return undefined;
  }

  static getCommentsByPostId(postId: string): Comment[] {
    const result: Comment[] = [];
    for (let i = 0; i < ForumStore.comments.length; i++) {
      if (ForumStore.comments[i].postId === postId) {
        result.push(ForumStore.comments[i]);
      }
    }
    return result;
  }

  static addComment(postId: string, content: string): void {
    const comment = Comment.of(
      `${ForumStore.nextCommentId}`,
      postId,
      '匿名老登',
      '🧑',
      content,
      '刚刚'
    );
    ForumStore.nextCommentId++;
    ForumStore.comments.push(comment);
    const post = ForumStore.getPostById(postId);
    if (post !== undefined) {
      post.comments += 1;
    }
  }

  static toggleLike(postId: string): void {
    const post = ForumStore.getPostById(postId);
    if (post !== undefined) {
      if (post.liked) {
        post.likes -= 1;
        post.liked = false;
      } else {
        post.likes += 1;
        post.liked = true;
      }
    }
  }
}
