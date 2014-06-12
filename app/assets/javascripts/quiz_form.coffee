class QuizForm
  singleQuestion = """
    <div class="singleQuestion">
      <legend>Question</legend>
        <div class="form-group">
          <input type="text" class="form-control" name="quiz[questions_attributes][][content]" placeholder="Question" />
        </div>
        <div class="form-group">
          <input type="text" class="form-control" name="quiz[questions_attributes][][answers_attributes][][content]" placeholder="Answer" />
        </div>

        <a class="add-answer pull-right"><span class="glyphicon glyphicon-plus"></span> answer</a>
    </div>
  """

  singleAnswer = """
    <div class="form-group">
      <input type="text" class="form-control" name="quiz[questions_attributes][][answers_attributes][][content]" placeholder="Answer" />
    </div>
  """

  constructor: ->
    @add_question = $ '#add-question'
    @add_answer = $ '.add-answer'

    @questions = $ '#questions'

    @add_question.on 'click', @addQuestion
    @add_answer.on 'click', @addAnswer

  addQuestion: (event) =>
    event.preventDefault()

    question = $ singleQuestion
    @questions.append(question)

    $(".singleQuestion:last > .add-answer").on('click', @addAnswer)

  addAnswer: (event) ->
    event.preventDefault

    $(@).siblings().filter(':last').append($(singleAnswer))

$ ->
  new QuizForm()
