defmodule Geom do
	@moduledoc """
		Provides geometric functions.
	## Examples:
		iex> Geom.area(1, 2)
		2
	"""

	@doc """
	Calculate the area of a rectangle given width and length.
	"""	
	@spec area({atom(), number(), number()}) :: number()
	def area({shape, a, b}) do 
		area(shape, a, b)
	end
	defp area(shape, a, b) when a >= 0 and b >= 0 do
		case shape do
			:rectangle -> a * b
			:triangle -> a * b / 2.0
			:ellipse -> :math.pi * a * b
			_ -> 0
		end
	end
	defp area(_, _, _) do
		0
	end

end
