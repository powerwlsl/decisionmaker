class Issue < ActiveRecord::Base
  has_many :pros
  has_many :cons



  def pros_sum
    sum = pros.inject(0){|sum,pro| sum + pro.score}
  end

  def cons_sum
    sum = cons.inject(0){|sum,con| sum + con.score}
  end

  def pros_percentage
    self.pros_percentage = calculate_pros_percentage
  end

  def cons_percentage
    self.cons_percentage = 100 - pros_percentage
  end


  def result
    if pros_percentage > cons_percentage
      "You should do this!"
    elsif pros_percentage < cons_percentage
      "I think it's not a good idea.."
    else
      "Could you give me more pros or cons? It's hard to decide.."
    end
  end

  private

  def calculate_pros_percentage
    return 50 if pros_sum == 0 && cons_sum == 0
    (pros_sum / (pros_sum + cons_sum).to_f * 100).round
  end
end
