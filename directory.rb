@students = [] # an empty array accessible to all methods

def get_name
  # demonstrates one method of allowing the user to correct typos
    while true do
      puts "Name: "
      name = gets.chomp 
      
      puts "type 'c' to confirm, or hit return to retype"
      command = gets.chomp
      break if command == "c"
    end
  name == "" ? name = "default" : name
  return name.to_sym
end

def get_cohort
  # demonstrates an alternative \n removal than .chomp
  puts "Cohort:"
  cohort = gets.delete_suffix!("\n")
  cohort == "" ? cohort = "default" : cohort
  return cohort.to_sym
end

def input_students
  # get details or use 'default'
  puts "Please enter new student details"
  name = get_name
  cohort = get_cohort
  
  puts "***Leaving Name and Cohort empty will exit.***".center(50)
  puts "Warning incomplete entries will not be saved!".center(50)
  
  #breaks if BOTH name and cohort are empty or :default
  until name == :default && cohort == :default do
  
    # add hash to the array.
    @students << {
      name: name,
      cohort: cohort,
      hobbies: "evil",
      country_of_birth: "fiction",
      height: "tall..."
    }
    puts "Now we have ##{@students.count} students"
    
    puts "Enter next student's details"
    name = get_name
    cohort = get_cohort
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list(students = @students) #optional parameter lets this method be used in 'print_cohort'
  students.each_with_index  do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
    puts "hobbies: #{student[:hobbies]}".center(30)
    puts "country of birth: #{student[:country_of_birth]}".center(30)
    puts "height: #{student[:height]}".center(30)
  end
end

def print_by_cohort
  cohort_sort = Hash.new {|k,v| k[v] = []}
  
  #populate the hash
  @students.map do |student|
    cohort_sort[student[:cohort]] << student
  end
  
  #print cohort and students
  cohort_sort.each do |cohort,students|
    puts cohort
    print_students_list(students) #Utilize an existing method!
  end
end

def print_no_each
  #same function as above but without using .each
  counter = 0
  while counter < @students.count do
    puts "#{@students[counter][:name]} (#{@students[counter][:cohort]} cohort)}"
    counter += 1
  end
end

def print_names_beginning_with
  puts "enter first character:"
  begins = gets.chomp
  
  @students.each_with_index  do |student, index|
    #print students that beginning with character given
    if student[:name][0] == begins
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)}"
    end
  end
end

def print_names_shorter_than_12_chars
  length = 12
  
  @students.each_with_index  do |student, index|
    #print students with names shorter than 12 characters
    if student[:name].length < length
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)}"
    end
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
end

def show_students
  print_header
  #print_students_list
  #print_names_beginning_with
  #print_names_shorter_than_12_chars
  #print_no_each
  print_by_cohort
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu