class Timer
  #write your code here
  def initialize
  	@seconds = 0
  end

  def seconds=(sec)
  	@seconds = sec
  end

  def seconds
  	@seconds
  end

  def time_string
  	mins = @seconds / 60
  	sec = padded(@seconds % 60)
  	hours = padded(mins / 60)
  	mins = padded(mins % 60)

  	return "#{hours}:#{mins}:#{sec}"
  end

  def padded n
  	if n < 10
  		return "0" + n.to_s
  	else
  		return n.to_s
  	end
  end

end
