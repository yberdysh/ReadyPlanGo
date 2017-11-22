class Language < ApplicationRecord
  belongs_to :country

  def to_s
    self.name.capitalize
  end
end
