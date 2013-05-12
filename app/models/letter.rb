class Letter < ActiveRecord::Base
  include AASM

  attr_accessible :attachment_count, :sender, :state, :user_id, :attachments_attributes

  aasm column: 'state' do
    state :scanned, :initial => true
    state :sent_by_email
    state :letter_requested
    state :sent_by_mail
  end

  belongs_to :user
  has_many :attachments

  accepts_nested_attributes_for :attachments, reject_if: proc { |attributes| attributes['image'].blank? }

  def upload_to_dropbox
    return false if user.dropbox_uid.present?

    require 'dropbox_sdk'
    session = DropboxSession.new('uyfb3p5lj2z6qpn', 'yjuwb085u0gw1zl')
    session.set_access_token user.dropbox_token, user.dropbox_secret
    client = DropboxClient.new(session, :app_folder)

    for attachment in self.attachments
      if Rails.env.development?
        file = File.open(attachment.image.path)
      else
        file = open(attachment.image.url).read
      end
      response = client.put_file('/' + attachment.image.to_s.split('/').last, file)
    end
    true
  end
end
