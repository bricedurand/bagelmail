class Letter < ActiveRecord::Base
  include AASM

  attr_accessible :attachment_count, :sender, :state, :user_id, :attachments_attributes

  aasm column: 'state' do
    state :scanned, :initial => true
    state :sent_by_email
    state :letter_requested
    state :sent_by_mail
  end

  belongs_to :letter
  has_many :attachments

  accepts_nested_attributes_for :attachments, reject_if: proc { |attributes| attributes['image'].blank? }

end
