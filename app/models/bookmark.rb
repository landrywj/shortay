# frozen_string_literal: true

# This class creates bookmarks with short URLs which redirect users to external sites.
class Bookmark < ApplicationRecord
  validates :title, :link, :shortay, presence: true
  validates :link, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  before_validation :create_shortay
  alias_attribute :slug, :shortay

  def create_shortay
    return unless shortay.nil?

    self.shortay = SecureRandom.urlsafe_base64(7, false)
  end
end
