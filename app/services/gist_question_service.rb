# frozen_string_literal: true

class GistQuestionService
  class Result
    def initialize(result)
      @result = result
    end

    def success?
      !@result[:html_url].nil?
    end

    def [](key)
      @result[key]
    end
  end

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    GistQuestionService::Result.new(@client.create_gist(gist_params))
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', test: @test.title),
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end
