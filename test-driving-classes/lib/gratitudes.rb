class Gratitudes
  def initialize
    @gratitudes = []
  end

  def add(gratitude)
    @gratitudes << gratitude
  end

  def format
    prefix = "Be grateful for: "
    formatted_gratitudes = @gratitudes.join(", ")
    return prefix + formatted_gratitudes
  end
end