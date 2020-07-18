class Topic < ActiveRecord::Base
  belongs_to :course
  has_one_attached :video

  private
end
