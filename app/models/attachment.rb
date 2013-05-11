class Attachment < ActiveRecord::Base
  attr_accessible :letter_id, :index, :image

  belongs_to :letter
  mount_uploader :image, AttachmentUploader
end
