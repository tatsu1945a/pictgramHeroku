class CommentsController < ApplicationController
  #def index
  #  # コメントした記事のみ表示する
  #  ##@commented_topics = current_user.commented_topics
  #end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id].to_i
    comment.content = params[:content]

    if comment.save
      redirect_to topic_path(:id=> params[:topic_id]), success: 'コメントを登録しました'
    else
      redirect_to topic_path(:id=> params[:topic_id]), danger: 'コメントの登録に失敗しました'
    end
  end
end
