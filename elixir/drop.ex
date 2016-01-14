defmodule Drop do
  @doc """
  XXX TEST!
  """

  @spec fall_velocity(number(), number()) :: number()

  def fall_velocity(:earth, dist) when dist > 0 do
    :math.sqrt(2 * 9.8 * dist)
  end

  def fall_velocity(:moon, dist) do
    :math.sqrt(2 * 1.6 * dist)
  end

  def fall_velocity(:mars, dist) do
    :math.sqrt(2 * 3.71 * dist)
  end
end
