class Attachment < ActiveRecord::Base
  attr_accessible :mail_id, :index, :image

  belongs_to :mail
  mount_uploader :image, AttachmentUploader
end
