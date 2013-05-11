class Attachment < ActiveRecord::Base
  attr_accessible :mail_id, :index

  belongs_to :mail
end
