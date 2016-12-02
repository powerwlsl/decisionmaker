class Pro < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :pro_text, :importance

  def score
    if self.importance == "Very important"
      5
    elsif self.importance == "Medium"
      3
    else
      1
    end
  end



end
