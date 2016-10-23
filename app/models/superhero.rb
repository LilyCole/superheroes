class Superhero < ApplicationRecord
  belongs_to :team
  has_many :superhero_superpowers, dependent: :destroy
  has_many :superpowers, through: :superhero_superpowers 
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.image_url  ||= ''
    self.name ||= ''
    self.true_identity ||=''
  end
end
