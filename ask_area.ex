defmodule AskArea do
	@moduledoc """
		Module to calculate area of geometric shapes based on user input.
	"""

	require Geom
	
	@doc """
		converts strings of shapes to atomic representation.
		ex. char_to_shape("r") -> :rectangle
	"""
	@spec char_to_shape(String.t()) :: atom()
	def char_to_shape(ch) do
		case String.first ch |> String.upcase do
			"R" -> :rectangle
			"T" -> :triangle
			"E" -> :ellipse	
			_ -> :unknown
		end
	end
	
	@doc """
		converts string input to integer.
		ex. get_number("5/n") -> 5
	"""
	@spec get_number(String.t()) :: number()
	def get_number(prompt) do
		num = IO.gets "Enter #{prompt} >" 
		String.trim(num, "\n") |> String.to_integer
	end

	@doc """
		returns tuple of dimension values from two prompt strings as inputs.
		ex. get_dimensions("width", "length") -> {5, 2}
	"""

	@spec get_dimensions(String.t(), String.t()) :: {number(), number()}
	def get_dimensions(dim1, dim2) do
		{get_number(dim1), get_number(dim2)}
	end
	
	@doc """
		calculates area using Geom.area.
		ex. calculate(:rectangle, 5, 10) -> 50
	"""
	@spec calculate(atom(), number(), number()) :: number()	
	def calculate(shape, dim1, dim2) do
		cond do
			shape == :unknown -> IO.puts("unknown shape #{shape}")
			dim1 < 0 or dim2 < 0 -> IO.puts("both numbers must be non-negative")
			true -> Geom.area({shape, dim1, dim2})
		end
	end
	
	@doc"""
		ask for user input.
	"""
	def area() do
		ch = IO.gets "R)ectangle, T)riangle, or E)llipse"
		shape = char_to_shape(ch)
		{a, b} = case shape do
			:rectangle -> get_dimensions("width", "length")
			:triangle -> get_dimensions("base", "height")
			:ellipse -> get_dimensions("major axis", "minor axis")
			:unknown -> {String.first(ch), 0}
		end
		calculate(shape, a, b)
	end			
end

