class UrlShortener < ApplicationRecord
    validates :url, presence: true
end
