require 'date'
require 'byebug'
class Cat < ActiveRecord::Base
  COLORS = %w(red brown white black)
  validates :color, inclusion: COLORS
  validates :sex, inclusion: %w(M F)
  validates :birth_date, :name, :description, :sex, presence: true

  def age
    (Date.today - birth_date).to_i/365
  end

end
