class Artist < ActiveRecord::Base
  has_many :albums

  validates :name, presence: true
  validates :name, uniqueness: { scope: :is_group, case_sensitive: false}

  after_initialize :assign_default_values

  private
  def assign_default_values
    return unless self.is_group.nil?
    self.is_group = false
  end
end
