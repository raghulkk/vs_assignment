sudoku_validator = [
  [1,5,2,4,8, 9, 3, 7, 6 ],
  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]]


sudoku_validator_2 = [
  [ 1, 1, 2, 4, 8, 9, 3, 7, 6 ],
  [ 7, 3, 9, 2, 5, 6, 8, 4, 1 ],
  [ 4, 6, 8, 3, 7, 1, 2, 9, 5 ],
  [ 3, 8, 7, 1, 2, 4, 6, 5, 9 ],
  [ 5, 9, 1, 7, 6, 3, 4, 2, 8 ],
  [ 2, 4, 6, 8, 9, 5, 7, 1, 3 ],
  [ 9, 1, 4, 6, 3, 7, 5, 8, 2 ],
  [ 6, 2, 5, 9, 4, 8, 1, 3, 7 ],
  [ 8, 7, 3, 5, 1, 2, 9, 6, 4 ]]

class SudokuValidator

  attr_reader :array
  
  def initialize(array)
   @array = array
  end

  def check
    check_row

    check_column

    check_box
  end

  def compare(arr)
    find_range(arr) &&  find_original(arr)
  end

  def find_range(arr)
    arr.each do |elem|
      (1..9).include?(elem)
    end
  end

  def find_original(arr)
    result = []
    arr.each do |elem|
      unless result.include?(elem)
        result << elem
      end
    end

    result.length == arr.length
  end


  def box_indexes
  [ [0, 0], [0, 3], [0, 6],
    [3, 0], [3, 3], [3, 6],
    [6, 0], [6, 3], [6, 6] ]
  end

  def get_box_array(row_index, col_index)
    [
      array[row_index][col_index], array[row_index][col_index+1], array[row_index][col_index+2],
      array[row_index+1][col_index], array[row_index+1][col_index+1], array[row_index+1][col_index+2],
      array[row_index+2][col_index], array[row_index+2][col_index+1], array[row_index+2][col_index+2]
    ]
  end

  def check_box
    box_indexes.all? do |box_index|
      box_array = get_box_array(box_index[0], box_index[1])
      compare(box_array)
    end
  end

  def check_row
    array.each do |elem|
      compare(elem)
    end
  end

  def check_column
     new_array = []
     i = 0
    
    while i < array.length
      new_array[i] = []
      j = 0 
      while j < array.length
        new_array[i] << array[j][i]
        j += 1
      end
      i += 1
    end

    new_array.all? do |elem|
      compare(elem)
    end 
  end
end

a = SudokuValidator.new(sudoku_validator)
puts a.check


b = SudokuValidator.new(sudoku_validator_2)
puts b.check
