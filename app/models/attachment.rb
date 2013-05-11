class Attachment < ActiveRecord::Base
  attr_accessible :usermail_id, :index, :image

  belongs_to :usermail
  mount_uploader :image, AttachmentUploader
end
