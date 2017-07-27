defmodule Dates do
    @moduledoc """
        This module deals with parsing date values.
    """
    
    @spec date_parts(String.t()) :: list(integer())
    @doc """
        separate ISO date string into integer list in format [yyyy, mm, dd]
    """
    def date_parts(iso) do
        for x <- String.split(iso, "-") do 
            String.to_integer x
        end
    end
end
