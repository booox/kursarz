class RubyAssignmentRunner < Struct.new(:assignment_submission_id)
  def run!
    @assignment = Assignment.find(assignment_id)
    @assignment_submission = @assignment.assignment_submission

    filename = "#{@assignment.id}#{Time.now}#{@assignment_submission.user_id}"
    test_filename = "#{filename}_spec.rb"

    f = File.new(filename, "w+")
    f.write(@assignment_submission.code)
    f.close

    f = File.new("#{filename}_spec.rb", "w+")
    f.puts("require_relative '#{filename}'")
    f.puts
    f.puts(@assignment.code)
    f.close

    output = %x{ rspec #{test_filename} }

    [$?, output]
  end
end
