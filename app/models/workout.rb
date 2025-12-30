class Workout < ApplicationRecord
    extend FriendlyId
    friendly_id :Name, use: :slugged

    belongs_to :user

    # Alias to provide lowercase accessor for compatibility
    alias_attribute :name, :Name
end
