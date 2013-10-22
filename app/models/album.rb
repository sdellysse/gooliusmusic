class Album < ActiveRecord::Base
  belongs_to :artist
  has_many :discs

  validates :artist, presence: true
  validates :name, presence: true
  validates :name, uniqueness: { scope: :artist, case_sensitive: false }

  after_initialize :assign_default_values

  private
  def assign_default_values
    if self.is_compilation.nil?
      self.is_compilation = false
    end

    if self.discs.empty?
      self.discs.build(number: 1)
    end
  end
end
