class Mail < ActiveRecord::Base
  include AASM

  attr_accessible :attachment_count, :sender, :state, :user_id

  aasm column: 'state' do
    state :scanned, :initial => true
    state :sent_by_email
    state :mail_requested
    state :sent_by_mail
  end

  belongs_to :user
  has_many :attachments
end
