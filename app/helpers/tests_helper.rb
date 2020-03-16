module TestsHelper
	TEST_LEVELS = { 1 => :easy, 2 => :elementary, 3 => :advanced, 4 => :hard }.freeze

  def test_level(test)
  	# Поскольку симпол будет вызван внутри фрагмента представления, 
  	# то автоматом символ будет преобразован к строке
  	TEST_LEVELS[test.level] || :hero

  	# case test.level
  	# when 1
  	# 	'easy'
  	# when 2
  	# 	'elementary'
  	# when 3
  	# 	'advanced'
  	# when 4
  	# 	'hard'
  	# else
  	# 	'hero'
  	# end
  end

  def test_question(test)
    test.questions.size
  end
end
