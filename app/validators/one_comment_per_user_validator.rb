class OneCommentPerUserValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:base, "One comment per user allowed!") if !valid_comment?(record)
  end

  private

  def valid_comment?(comment)
    return false if Comment.where(movie_id: comment.movie_id, user_id: comment.user_id).where.not(id: comment.id).count > 0
    return true
  end
end