defmodule Powers do
import Kernel, except: [raise: 2]
	def raise(x, n) when n < 0 do
		(1 / x ) * raise(x, n + 1)
	end	
	def raise(_, n) when n == 0 do
		1
	end
	def raise(x, n) when n == 1 do
		x
	end
	def raise(x, n) do
		x * raise(x, n - 1)
	end


	def nth_root(x, n) do 
		nth_root(x, n, x / 2)
	end
	def nth_root(x, n, a) do
		f = raise(a, n) - x
		f_prime = n * raise(a, n - 1)
		next = a - f / f_prime
		change = abs(next - a)
		IO.puts("Current guess is #{next}")
		if change < 1.0e-8 do
			next
		else
			nth_root(x, n, next)
		end
	end

end
