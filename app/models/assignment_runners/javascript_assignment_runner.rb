class JavascriptAssignmentRunner
  def initialize(assignment_submission)
    @assignment_submission = assignment_submission
    @assignment = @assignment_submission.assignment
  end

  def run!
    filename = "#{@assignment.id}_#{Time.now.to_i}_#{@assignment_submission.user_id}"
    test_filename = "#{filename}_spec"

    f = File.new("#{test_filename}.js", "w+")
    f.puts(@assignment_submission.code)
    f.puts
    f.puts(@assignment.code)
    f.close

    output = %x{ ~/node/node_modules/jasmine-node/bin/jasmine-node #{test_filename}.js }

    # save returned status code and output
    result = [$? == 0 ? 0 : 1, output]

    %x{ rm #{test_filename}.js }

    result
  end
end
