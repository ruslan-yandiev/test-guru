module TestPassagesHelper
   def final_result
    if @test_passage.percent_result >= 85
      'You have successfully passed the test'
    else
      'you failed the test'
    end
  end
end
