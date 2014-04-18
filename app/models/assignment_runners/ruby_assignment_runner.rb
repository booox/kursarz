class RubyAssignmentRunner
  def initialize(assignment_submission_id)
    @assignment_submission = AssignmentSubmission.find(assignment_submission_id)
    @assignment = @assignment_submission.assignment
  end

  def run!
    filename = "#{@assignment.id}_#{Time.now.to_i}_#{@assignment_submission.user_id}"
    test_filename = "#{filename}_spec"

    f = File.new("#{filename}.rb", "w+")
    f.write(@assignment_submission.code)
    f.close

    f = File.new("#{test_filename}.rb", "w+")
    f.puts("require_relative '#{filename}'")
    f.puts
    f.puts(@assignment.code)
    f.close

    output = %x{ rspec #{test_filename}.rb }

    # save returned status code and output
    result = [$? == 0 ? 0 : 1, output]

    %x{ rm #{filename}.rb #{test_filename}.rb }

    result
  end
end
