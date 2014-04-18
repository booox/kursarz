class Course
  constructor: ->
    @course_description = $ '#course_description'
    @show_description = $ '#show_description'

    console.log "dupa"

    @show_description.on 'click', @toggle_description

  toggle_description: (event) =>
    event.preventDefault()

    @course_description.toggle()
    @show_description.toggle()

$ ->
  new Course()

