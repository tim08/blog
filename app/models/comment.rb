class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, :presence => true


  def already_passed?
    created_at+15.minutes < DateTime.now
  end
end
