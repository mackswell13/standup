class Invitation < ApplicationRecord
  belongs_to :company
  before_create :generate_unique_token
  before_create :set_defaults

  private

  def generate_unique_token
    loop do
      self.token = SecureRandom.hex(10)
      break unless Invitation.exists?(token: self.token)
    end
  end

  def set_defaults
    self.used = false
    self.expires_at = 24.hours.from_now
  end
end
