# frozen_string_literal: true

# This class creates bookmarks with short URLs which redirect users to external sites.
class Bookmark < ApplicationRecord
  validates :title, :link, :shortay, presence: true
  validates :link, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  before_validation :create_shortay
  alias_attribute :slug, :shortay

  VOWELS = %w[a e i o u].freeze

  def create_shortay
    return unless shortay.nil?

    self.shortay = SecureRandom.urlsafe_base64(7, false)
  end

  def calculate_pricing
    vowels = []
    cons = []
    dups = shortay.length - shortay.chars.compact.uniq.length
    shortay.downcase.each_char do |char|
      if VOWELS.include?(char)
        vowels << char
      else
        cons << char
      end
    end
    [cons.length, dups, (vowels.uniq.length * 2)].sum
  end
end
