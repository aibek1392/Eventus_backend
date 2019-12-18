class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    # validates :username, length: {minimum: 2}
    # validates :password, length: { in: 6..20 }
    has_many :events
    
    has_many :event_comments
    has_many :events_commented_on, through: :event_comments, source: :event

    has_many :user_events
    has_many :attending_events, through: :user_events, source: :event

    has_many :favorite_events
    has_many :my_favorite_events, through: :favorite_events, source: :event

end
