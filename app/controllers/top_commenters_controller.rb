class TopCommentersController < ApplicationController
  def index
    @users = User.joins(:comments)
      .where("DATE(comments.created_at) between :date_from and :date_to", date_from: (Date.today - 7.days), date_to: Date.today)
      .group('users.name').select('users.name as name, count(*) as comments_count').order('comments_count desc').limit(10)
  end
end