class Calculate
  def initialize(sum, arr = [])
    @sum = sum
    @arr = arr
  end

  def calculate_desired_sum
    results = []
    except_numbers = []

    @arr.each do |number|
      next if number > @sum

      results << [number, @sum - number] if valid_number?(except_numbers, number)
      except_numbers << number
    end

    results
  end

  private

  def valid_number?(except_numbers, first_number)
    second_number = @sum - first_number
    return false if first_number == second_number
    return false unless @arr.include?(second_number)
    return false if except_numbers.include?(first_number) || except_numbers.include?(second_number)

    true if @arr.include?(second_number)
  end
end

# p Calculate.new(10, [3, 4, 5, 6, 7]).calculate_desired_sum
# p Calculate.new(8, [3, 4, 5, 4, 4]).calculate_desired_sum
