# ------------------------------------------------------
# THIS FILE WAS AUTOMATICALLY GENERATED (DO NOT MODIFY)
# ------------------------------------------------------

type CommentLike {
  id: String!
  comment_id: String!
  user_id: String!
  user: User!
  created_at: DateTime!
  updated_at: DateTime!
}

"""
A date-time string at UTC, such as 2019-12-03T09:54:33Z, compliant with the date-time format.
"""
scalar DateTime

type PostLike {
  id: String!
  post_id: String!
  user_id: String!
  user: User!
  created_at: DateTime!
  updated_at: DateTime!
}

type Post {
  id: String!
  title: String!
  description: String!
  likes_count: Float!
  comments_count: Float!
  user: User!
  likes: [PostLike!]!
  comments: [Comment!]!
  author_id: String!
  created_at: DateTime!
  updated_at: DateTime!
}

type Comment {
  id: String!
  post_id: String!
  user_id: String!
  likes_count: Float!
  content: String!
  user: User!
  likes: [CommentLike!]!
  created_at: DateTime!
  updated_at: DateTime!
}

type User {
  id: String!
  name: String!
  email: String!
  posts: [Post!]!
  created_at: DateTime!
  updated_at: DateTime!
}

type UserType {
  id: String!
  name: String!
}

type Session {
  user: UserType!
  token: String!
}

type CreateLikeType {
  id: String!
  status: String!
}

type DeleteLikeType {
  status: String!
}

type Query {
  getUsers: [User!]!
  getUnique(user_id: String!): User!
  getPosts: [Post!]!
  getPostLikes(post_id: String!): [PostLike!]!
  getComments(post_id: String!): [Comment!]!
  getCommentLikes(comment_id: String!): [CommentLike!]!
}

type Mutation {
  createUser(password: String!, email: String!, name: String!): User!
  session(password: String!, email: String!): Session!
  createPost(description: String!, title: String!): Post!
  createPostLike(post_id: String!): CreateLikeType!
  deletePostLike(post_like_id: String!): DeleteLikeType!
  createComment(content: String!, post_id: String!): Comment!
  createCommentLike(comment_id: String!): CreateLikeType!
  deleteCommentLike(comment_like_id: String!): DeleteLikeType!
}
