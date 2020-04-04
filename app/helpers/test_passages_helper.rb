module TestPassagesHelper
  def final_result
    if @test_passage.success?
      t('.You have successfully passed the test')
    else
      t('.You failed the test')
    end
  end

  def red_or_green!
  	@test_passage.success? ? 'right' : 'not_true'
  end
end
