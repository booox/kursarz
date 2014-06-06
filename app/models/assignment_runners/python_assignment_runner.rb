class PythonAssignmentRunner
  def initialize(assignment_submission)
    @assignment_submission = assignment_submission
    @assignment = @assignment_submission.assignment
  end

  def run!
    filename = "#{@assignment.id}_#{Time.now.to_i}_#{@assignment_submission.user_id}"
    test_filename = "#{filename}_test"

    f = File.new("#{test_filename}.py", "w+")
    f.puts(@assignment_submission.code)
    f.puts
    f.puts(@assignment.code)
    f.close

    output = %x{ python #{test_filename}.py }

    # save returned status code and output
    result = [$? == 0 ? 0 : 1, output]

    %x{ rm #{test_filename}.py }

    result
  end
end
