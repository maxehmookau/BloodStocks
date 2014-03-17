class BloodType < ActiveRecord::Base

  has_many :records

  def name
    letter + positive_name
  end

  private

  def positive_name
    positive? ? 'pos' : 'neg'
  end

end
