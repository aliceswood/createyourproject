class Todo
  def initialize(task)
    @task = task
    @done_status = false
  end

  def task
    return @task
  end

  def mark_done!
    if @done_status == true 
      return "this task is already done!"
    else
      @done_status = true
    end
  end

  def done?
    return @done_status
  end
end