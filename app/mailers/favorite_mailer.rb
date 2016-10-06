class FavoriteMailer < ApplicationMailer
  default from: "briansmont830@gmail.com"
  
  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@secret-taiga-69974.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@secret-taiga-69974.example>"
    headers["References"] = "<post/#{post.id}@secret-taiga-69974.example>"
    
    @user = user
    @post = post
    @comment = comment
    
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
  def new_post(post)
    headers["Message-ID"] = "<comments/#{post.id}@secret-taiga-69974.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@secret-taiga-69974.example>"
    headers["References"] = "<post/#{post.id}@secret-taiga-69974.example>"    
    
    @post = post
    mail(to: post.user.email, subject: "You favorited post #{post.title}.")
  end
end
