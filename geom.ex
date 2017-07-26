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
	@spec area(atom(), number(), number()) :: number()
	
	def area(:rectangle, length, width) when length >= 0 and width >= 0 do
		length * width
	end
	def area(:triangle, base, height) when base >= 0 and height >= 0  do
		height * base / 2.0
	end
	def area(:ellipse, major, minor) when major >= 0 and minor >= 0 do
		:math.pi * major * minor
	end
	def area(_, _, _) do
		0
	end

end
