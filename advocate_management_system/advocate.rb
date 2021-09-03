require './case'
require './state'

class Advocate

  attr_accessor :id, :states, :cases, :junior_advocates

  def initialize(id)
    @id = id
    @cases = []
    @states = []
    @junior_advocates = []
  end

  def add_state(state_code)
    states << State.new(state_code)
  end

  def add_case(case_id, state_code)
    cases << Case.new(case_id, state_code)
  end

  def add_junior(junior_id)
    junior_advocates << JuniorAdvocate.new(junior_id)
  end

end

class JuniorAdvocate < Advocate
  attr_accessor :id, :states, :cases

  def initialize(id)
    @id = id
    @cases = []
    @state = []
  end
end