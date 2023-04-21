class Todo
  def initialize(task)
    @task = task
    @done_status = false
  end

  def task
    return @task
  end
  
  def mark_complete!
    @done_status = true
  end
  
  def complete?
    @done_status == true
  end
end