class State
  attr_accessor :code, :cases

  def initialize(code)
    @code = code
    @cases = []
  end

  def add_case(case_obj)
    cases << case_obj
  end
end