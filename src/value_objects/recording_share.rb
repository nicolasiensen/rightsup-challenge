class RecordingShare
  attr_accessor :right_holder, :total

  def initialize right_holder:, total:
    @right_holder = right_holder
    @total = total
  end
end
