require './advocate'
puts "Welcome to Advocate management system"
puts "1. Add an advocate"
puts "2. Add junior advocates"
puts "3. Add states for advocate"
puts "4. Add cases for advocate"
puts "5. Reject a case."
puts "6. Display all advocate"
puts "7. Display all cases under a state"
puts ""
puts "Type exit and press enter to break"


@advocates = []

def add_advocate(details)
  advocate = Advocate.new(details)
  @advocates << advocate
  advocate
end

def find_advocate(id)
  @advocates.detect { |elem| elem.id == id }
end

while true
  puts "Enter the input number"

  input = gets.chomp

  break if input == "exit"

  case input.to_i
  when 1
    puts "Add an advocate: "
    input_option = gets.chomp
    advocate = add_advocate(input_option)
    puts "Advocate added #{advocate.id}"
    puts "Advocate Name: #{advocate.id}"
  when 2
    puts "Senior Advocate ID: "
    senior_advocate_id = gets.chomp
    puts "Junior ID: "
    junior_id = gets.chomp

    senior_advocate = find_advocate(senior_advocate_id)
    senior_advocate.add_junior(junior_id)
    puts senior_advocate.junior_advocates
  when 3
    puts "Advocate ID: "
    advocate_id = gets.chomp

    puts "Practicing State:"
    state_input = gets.chomp

    advocate = find_advocate(advocate_id)
    advocate.add_state(state_input)

    puts "State Added #{state_input} for #{advocate_id}"
    puts puts advocate.states.inspect
  when 4
    puts "Advocate ID: "
    advocate_id = gets.chomp

    puts "Case ID:"
    case_input = gets.chomp

    puts "Practicing State:"
    state_input = gets.chomp

    advocate = find_advocate(advocate_id)
    state = advocate.states.detect { |s| s.code == state_input }
    advocate.add_case(case_input, state.code)
    case_obj = advocate.cases.detect { |c| c.id == case_input }
    state.add_case(case_obj)
    puts "Case #{case_input} added for #{advocate_id}"
    puts advocate.cases.inspect
  when 6
    @advocates.each do |elem|
      puts "Advocate name: #{elem.id}"
    end
  when 7
    puts "State Id:"
    state_input = gets.chomp

    @advocates.each do |elem|
      state = advocate.states.detect { |s| s.code == state_input }
      state_cases = state.cases
      puts "#{elem.id}: #{state_cases.map{ |sc| sc.id}}"
    end

  end
end

