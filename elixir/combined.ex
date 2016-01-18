defmodule Combined do
  def height_to_mph(meters) do
    import Convert, only: [mps_to_mph: 1]
    Drop.fall_velocity meters |> mps_to_mph
  end
end
