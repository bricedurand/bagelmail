class Mail < ActiveRecord::Base
  attr_accessible :attachment_count, :sender, :state, :user_id

  belongs_to :user
end
