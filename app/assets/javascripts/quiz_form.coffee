class QuizForm
  singleQuestion = """
    <div class="singleQuestion">
      <h3>Question</h3>
      <div class="form-group">
        <input type="text" class="form-control" name="quiz[questions_attributes][][content]" />
      </div>
      <h5>Answers</h5>
      <div class="form-group">
        <div class="checkbox">
          <input type="checkbox" name="quiz[questions_attributes][][answers_attributes][][correct]" value="">
          <input type="text" class="form-control" name="quiz[questions_attributes][][answers_attributes][][content]" />
        </div>
      </div>
      <a class="add-answer pull-right"><span class="glyphicon glyphicon-plus"></span> answer</a>
    </div>
  """

  singleAnswer = """
    <div class="form-group">
      <div class="checkbox">
        <input type="checkbox" name="quiz[questions_attributes][][answers_attributes][][correct]" value="">
        <input type="text" class="form-control" name="quiz[questions_attributes][][answers_attributes][][content]" />
      </div>
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

    $(@).before($(singleAnswer))

$ ->
  new QuizForm()
