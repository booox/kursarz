class QuizForm
  singleQuestion = """
    <div class="singleQuestion">
      <legend>Question</legend>
        <div class="form-group">
          <input type="text" class="form-control" name="quiz[questions_attributes][][content]" placeholder="Question" />
        </div>
        <div>
          <input type="text" class="form-control" name="quiz[questions_attributes][][answers_attributes][][content]" placeholder="Answer" />
        </div>

        <button id="#add-answer" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span> answer</button>
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

  addAnswer: (event) ->
    event.preventDefault

    $(@).prepend($(singleAnswer))

$ ->
  new QuizForm()
