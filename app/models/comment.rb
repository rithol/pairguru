# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  message     :string
#  movie_id    :integer
#  user_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ApplicationRecord
  include ActiveModel::Validations
  
  belongs_to :movie
  belongs_to :user

  validates :message, presence: { :message => " - can't be empty." }
  validates_with OneCommentPerUserValidator
end
