defmodule RiichiAdvanced.Utils do
  alias RiichiAdvanced.Riichi, as: Riichi

  @to_tile %{"1m"=>:"1m", "2m"=>:"2m", "3m"=>:"3m", "4m"=>:"4m", "5m"=>:"5m", "6m"=>:"6m", "7m"=>:"7m", "8m"=>:"8m", "9m"=>:"9m", "0m"=>:"0m",
             "1p"=>:"1p", "2p"=>:"2p", "3p"=>:"3p", "4p"=>:"4p", "5p"=>:"5p", "6p"=>:"6p", "7p"=>:"7p", "8p"=>:"8p", "9p"=>:"9p", "0p"=>:"0p",
             "1s"=>:"1s", "2s"=>:"2s", "3s"=>:"3s", "4s"=>:"4s", "5s"=>:"5s", "6s"=>:"6s", "7s"=>:"7s", "8s"=>:"8s", "9s"=>:"9s", "0s"=>:"0s",
             "1t"=>:"1t", "2t"=>:"2t", "3t"=>:"3t", "4t"=>:"4t", "5t"=>:"5t", "6t"=>:"6t", "7t"=>:"7t", "8t"=>:"8t", "9t"=>:"9t", "0t"=>:"0t",
             "1z"=>:"1z", "2z"=>:"2z", "3z"=>:"3z", "4z"=>:"4z", "5z"=>:"5z", "6z"=>:"6z", "7z"=>:"7z", "0z"=>:"0z", "8z"=>:"8z",
             "1x"=>:"1x", "2x"=>:"2x", "3x"=>:"3x", "4x"=>:"4x",
             "1f"=>:"1f", "2f"=>:"2f", "3f"=>:"3f", "4f"=>:"4f",
             "1g"=>:"1g", "2g"=>:"2g", "3g"=>:"3g", "4g"=>:"4g",
             "1a"=>:"1a", "2a"=>:"2a", "3a"=>:"3a", "4a"=>:"4a",
             "1y"=>:"1y", "2y"=>:"2y",
             "1j"=>:"1j", "2j"=>:"2j", "3j"=>:"3j", "4j"=>:"4j", "5j"=>:"5j", "6j"=>:"6j", "7j"=>:"7j", "8j"=>:"8j", "9j"=>:"9j", "10j"=>:"10j",
             "12j"=>:"12j", "13j"=>:"13j", "14j"=>:"14j", "15j"=>:"15j", "16j"=>:"16j", "17j"=>:"17j", "18j"=>:"18j", "19j"=>:"19j", 
             "1k"=>:"1k", "2k"=>:"2k", "3k"=>:"3k", "4k"=>:"4k",
             "1q"=>:"1q", "2q"=>:"2q", "3q"=>:"3q", "4q"=>:"4q",
             "11m"=>:"11m", "12m"=>:"12m", "13m"=>:"13m", "14m"=>:"14m", "15m"=>:"15m", "16m"=>:"16m", "17m"=>:"17m", "18m"=>:"18m", "19m"=>:"19m",
             "11p"=>:"11p", "12p"=>:"12p", "13p"=>:"13p", "14p"=>:"14p", "15p"=>:"15p", "16p"=>:"16p", "17p"=>:"17p", "18p"=>:"18p", "19p"=>:"19p",
             "11s"=>:"11s", "12s"=>:"12s", "13s"=>:"13s", "14s"=>:"14s", "15s"=>:"15s", "16s"=>:"16s", "17s"=>:"17s", "18s"=>:"18s", "19s"=>:"19s",
             "11t"=>:"11t", "12t"=>:"12t", "13t"=>:"13t", "14t"=>:"14t", "15t"=>:"15t", "16t"=>:"16t", "17t"=>:"17t", "18t"=>:"18t", "19t"=>:"19t",
             "11z"=>:"11z", "12z"=>:"12z", "13z"=>:"13z", "14z"=>:"14z", "15z"=>:"15z", "16z"=>:"16z", "17z"=>:"17z",
             "110m"=>:"110m", "110p"=>:"110p", "110s"=>:"110s", "110t"=>:"110t",
             "10m"=>:"10m", "10p"=>:"10p", "10s"=>:"10s", "10t"=>:"10t",
             "25z"=>:"25z", "26z"=>:"26z", "27z"=>:"27z",
             "any"=>:any, "faceup"=>:faceup,
             :"1m"=>:"1m", :"2m"=>:"2m", :"3m"=>:"3m", :"4m"=>:"4m", :"5m"=>:"5m", :"6m"=>:"6m", :"7m"=>:"7m", :"8m"=>:"8m", :"9m"=>:"9m", :"0m"=>:"0m",
             :"1p"=>:"1p", :"2p"=>:"2p", :"3p"=>:"3p", :"4p"=>:"4p", :"5p"=>:"5p", :"6p"=>:"6p", :"7p"=>:"7p", :"8p"=>:"8p", :"9p"=>:"9p", :"0p"=>:"0p",
             :"1s"=>:"1s", :"2s"=>:"2s", :"3s"=>:"3s", :"4s"=>:"4s", :"5s"=>:"5s", :"6s"=>:"6s", :"7s"=>:"7s", :"8s"=>:"8s", :"9s"=>:"9s", :"0s"=>:"0s",
             :"1t"=>:"1t", :"2t"=>:"2t", :"3t"=>:"3t", :"4t"=>:"4t", :"5t"=>:"5t", :"6t"=>:"6t", :"7t"=>:"7t", :"8t"=>:"8t", :"9t"=>:"9t", :"0t"=>:"0t",
             :"1z"=>:"1z", :"2z"=>:"2z", :"3z"=>:"3z", :"4z"=>:"4z", :"5z"=>:"5z", :"6z"=>:"6z", :"7z"=>:"7z", :"0z"=>:"0z", :"8z"=>:"8z",
             :"1x"=>:"1x", :"2x"=>:"2x", :"3x"=>:"3x", :"4x"=>:"4x",
             :"1f"=>:"1f", :"2f"=>:"2f", :"3f"=>:"3f", :"4f"=>:"4f",
             :"1g"=>:"1g", :"2g"=>:"2g", :"3g"=>:"3g", :"4g"=>:"4g",
             :"1a"=>:"1a", :"2a"=>:"2a", :"3a"=>:"3a", :"4a"=>:"4a",
             :"1y"=>:"1y", :"2y"=>:"2y",
             :"1j"=>:"1j", :"2j"=>:"2j", :"3j"=>:"3j", :"4j"=>:"4j", :"5j"=>:"5j", :"6j"=>:"6j", :"7j"=>:"7j", :"8j"=>:"8j", :"9j"=>:"9j", :"10j"=>:"10j",
             :"12j"=>:"12j", :"13j"=>:"13j", :"14j"=>:"14j", :"15j"=>:"15j", :"16j"=>:"16j", :"17j"=>:"17j", :"18j"=>:"18j", :"19j"=>:"19j",
             :"1k"=>:"1k", :"2k"=>:"2k", :"3k"=>:"3k", :"4k"=>:"4k",
             :"1q"=>:"1q", :"2q"=>:"2q", :"3q"=>:"3q", :"4q"=>:"4q",
             :"11m"=>:"11m", :"12m"=>:"12m", :"13m"=>:"13m", :"14m"=>:"14m", :"15m"=>:"15m", :"16m"=>:"16m", :"17m"=>:"17m", :"18m"=>:"18m", :"19m"=>:"19m",
             :"11p"=>:"11p", :"12p"=>:"12p", :"13p"=>:"13p", :"14p"=>:"14p", :"15p"=>:"15p", :"16p"=>:"16p", :"17p"=>:"17p", :"18p"=>:"18p", :"19p"=>:"19p",
             :"11s"=>:"11s", :"12s"=>:"12s", :"13s"=>:"13s", :"14s"=>:"14s", :"15s"=>:"15s", :"16s"=>:"16s", :"17s"=>:"17s", :"18s"=>:"18s", :"19s"=>:"19s",
             :"11t"=>:"11t", :"12t"=>:"12t", :"13t"=>:"13t", :"14t"=>:"14t", :"15t"=>:"15t", :"16t"=>:"16t", :"17t"=>:"17t", :"18t"=>:"18t", :"19t"=>:"19t",
             :"11z"=>:"11z", :"12z"=>:"12z", :"13z"=>:"13z", :"14z"=>:"14z", :"15z"=>:"15z", :"16z"=>:"16z", :"17z"=>:"17z",
             :"110m"=>:"110m", :"110p"=>:"110p", :"110s"=>:"110s", :"110t"=>:"110t",
             :"10m"=>:"10m", :"10p"=>:"10p", :"10s"=>:"10s", :"10t"=>:"10t",
             :"25z"=>:"25z", :"26z"=>:"26z", :"27z"=>:"27z",
             :any=>:any, :faceup=>:faceup,
            }
  def to_tile(tile_spec) do
    case tile_spec do
      [tile_spec | attrs] -> {@to_tile[tile_spec], attrs}
      %{"tile" => tile_spec, "attrs" => attrs} -> {@to_tile[tile_spec], attrs}
      {tile_spec, attrs} -> {@to_tile[tile_spec], attrs}
      _ -> @to_tile[tile_spec]
    end
  end

  def is_tile(tile_spec) do
    case tile_spec do
      [tile_spec | _attrs] -> Map.has_key?(@to_tile, tile_spec)
      %{"tile" => tile_spec, "attrs" => _attrs} -> Map.has_key?(@to_tile, tile_spec)
      {tile_spec, attrs} -> Map.has_key?(@to_tile, tile_spec) && is_list(attrs)
      _ -> Map.has_key?(@to_tile, tile_spec)
    end
  end

  def tile_to_string(tile) do
    if tile != nil do
      tile |> strip_attrs() |> Atom.to_string()
    else nil end
  end

  def tile_to_attrs(tile) do
    case tile do
      {tile, attrs} -> [Atom.to_string(tile) | attrs]
      tile          -> [Atom.to_string(tile)]
    end
  end

  def to_attr_tile(tile) do
    case tile do
      {tile, attrs} -> {tile, attrs}
      tile          -> {tile, []}
    end
  end

  def add_attr(tile, attrs) do
    case tile do
      {tile, existing_attrs} -> {tile, Enum.uniq(existing_attrs ++ attrs)}
      _ when is_list(tile) -> Enum.map(tile, &add_attr(&1, attrs))
      _ when is_struct(tile, MapSet) -> MapSet.new(tile, &add_attr(&1, attrs))
      tile -> {tile, attrs}
    end
  end

  def remove_attr(tile, attrs) do
    case tile do
      {tile, existing_attrs} ->
        case Enum.uniq(existing_attrs -- attrs) do
          []              -> tile
          remaining_attrs -> {tile, remaining_attrs}
        end
      _ when is_list(tile) -> Enum.map(tile, &remove_attr(&1, attrs))
      _ when is_struct(tile, MapSet) -> MapSet.new(tile, &remove_attr(&1, attrs))
      tile -> tile
    end
  end

  def has_attr?(tile, attrs) do
    case tile do
      {_tile, existing_attrs} -> Enum.all?(attrs, & &1 in existing_attrs)
      _ when is_list(tile) -> Enum.any?(tile, &has_attr?(&1, attrs))
      _ when is_struct(tile, MapSet) -> MapSet.new(tile, &has_attr?(&1, attrs))
      _ -> Enum.empty?(attrs)
    end
  end

  def strip_attrs(tile) do
    case tile do
      {tile, _attrs} -> tile
      _ when is_list(tile) -> Enum.map(tile, &strip_attrs/1)
      _ when is_struct(tile, MapSet) -> MapSet.new(tile, &strip_attrs/1)
      tile -> tile
    end
  end

  @tile_color %{:"1m"=>"pink", :"2m"=>"pink", :"3m"=>"pink", :"4m"=>"pink", :"5m"=>"pink", :"6m"=>"pink", :"7m"=>"pink", :"8m"=>"pink", :"9m"=>"pink", :"0m"=>"red",
                :"1p"=>"lightblue", :"2p"=>"lightblue", :"3p"=>"lightblue", :"4p"=>"lightblue", :"5p"=>"lightblue", :"6p"=>"lightblue", :"7p"=>"lightblue", :"8p"=>"lightblue", :"9p"=>"lightblue", :"0p"=>"red",
                :"1s"=>"lightgreen", :"2s"=>"lightgreen", :"3s"=>"lightgreen", :"4s"=>"lightgreen", :"5s"=>"lightgreen", :"6s"=>"lightgreen", :"7s"=>"lightgreen", :"8s"=>"lightgreen", :"9s"=>"lightgreen", :"0s"=>"red",
                :"1x"=>"orange", :"2x"=>"orange",
                :"11m"=>"cyan", :"12m"=>"cyan", :"13m"=>"cyan", :"14m"=>"cyan", :"15m"=>"cyan", :"16m"=>"cyan", :"17m"=>"cyan", :"18m"=>"cyan", :"19m"=>"cyan",
                :"11p"=>"cyan", :"12p"=>"cyan", :"13p"=>"cyan", :"14p"=>"cyan", :"15p"=>"cyan", :"16p"=>"cyan", :"17p"=>"cyan", :"18p"=>"cyan", :"19p"=>"cyan",
                :"11s"=>"cyan", :"12s"=>"cyan", :"13s"=>"cyan", :"14s"=>"cyan", :"15s"=>"cyan", :"16s"=>"cyan", :"17s"=>"cyan", :"18s"=>"cyan", :"19s"=>"cyan",
                :"11z"=>"cyan", :"12z"=>"cyan", :"13z"=>"cyan", :"14z"=>"cyan", :"15z"=>"cyan", :"16z"=>"cyan", :"17z"=>"cyan"}
  def tile_color(tile), do: Map.get(@tile_color, tile, "white")

  # print tile, print hand
  # print tile, print hand
  def pt(tile) do
    {tile, _attrs} = to_attr_tile(tile)
    %{bold: true, color: tile_color(tile), text: "#{tile}"}
  end
  def ph(tiles), do: Enum.map(tiles, &pt/1)

  def sort_value(tile) do
    {tile, _attrs} = to_attr_tile(tile)
    case tile do
      :"1m" ->  10; :"2m" ->  20; :"3m" ->  30; :"4m" ->  40; :"0m" ->  50; :"5m" ->  51; :"6m" ->  60; :"7m" ->  70; :"8m" ->  80; :"9m" ->  90; :"10m" -> 95;
      :"1p" -> 110; :"2p" -> 120; :"3p" -> 130; :"4p" -> 140; :"0p" -> 150; :"5p" -> 151; :"6p" -> 160; :"7p" -> 170; :"8p" -> 180; :"9p" -> 190; :"10p" -> 195;
      :"1s" -> 210; :"2s" -> 220; :"3s" -> 230; :"4s" -> 240; :"0s" -> 250; :"5s" -> 251; :"6s" -> 260; :"7s" -> 270; :"8s" -> 280; :"9s" -> 290; :"10s" -> 295;
      :"1t" -> 310; :"2t" -> 320; :"3t" -> 330; :"4t" -> 340; :"0t" -> 350; :"5t" -> 351; :"6t" -> 360; :"7t" -> 370; :"8t" -> 380; :"9t" -> 390; :"10t" -> 395;
      :"11m" ->  12; :"12m" ->  22; :"13m" ->  32; :"14m" ->  42; :"15m" ->  52; :"16m" ->  62; :"17m" ->  72; :"18m" ->  82; :"19m" ->  92; :"110m" ->  96;
      :"11p" -> 112; :"12p" -> 122; :"13p" -> 132; :"14p" -> 142; :"15p" -> 152; :"16p" -> 162; :"17p" -> 172; :"18p" -> 182; :"19p" -> 192; :"110p" -> 196;
      :"11s" -> 212; :"12s" -> 222; :"13s" -> 232; :"14s" -> 242; :"15s" -> 252; :"16s" -> 262; :"17s" -> 272; :"18s" -> 282; :"19s" -> 292; :"110s" -> 296;
      :"11t" -> 312; :"12t" -> 322; :"13t" -> 332; :"14t" -> 342; :"15t" -> 352; :"16t" -> 362; :"17t" -> 372; :"18t" -> 382; :"19t" -> 392; :"110t" -> 396;
      :"1z" -> 1310; :"2z" -> 1320; :"3z" -> 1330; :"4z" -> 1340; :"0z" -> 1350; :"5z" -> 1351; :"8z" -> 1352; :"6z" -> 1360; :"7z" -> 1370;
      :"11z" -> 1312; :"12z" -> 1322; :"13z" -> 1332; :"14z" -> 1342; :"15z" -> 1352; :"16z" -> 1362; :"17z" -> 1372;
      :"25z" -> 1353; :"26z" -> 1363; :"27z" -> 1373;
      :"1f" -> 2380; :"2f" -> 2390; :"3f" -> 2400; :"4f" -> 2410;
      :"1g" -> 2420; :"2g" -> 2430; :"3g" -> 2440; :"4g" -> 2450;
      :"1a" -> 2460; :"2a" -> 2470; :"3a" -> 2480; :"4a" -> 2490;
      :"1y" -> 2500; :"2y" -> 2510;
      :"1j" -> 2520;
      :"2j" -> 2530; :"7j" -> 2540; :"8j" -> 2550; :"9j" -> 2560; :"3j" -> 2570; :"4j" -> 2580; :"10j" -> 2590; :"5j" -> 2600; :"6j" -> 2610; 
      :"12j" -> 2531; :"17j" -> 2541; :"18j" -> 2551; :"19j" -> 2561; :"13j" -> 2571; :"14j" -> 2581; :"15j" -> 2601; :"16j" -> 2611; 
      :"1k" -> 2620; :"2k" -> 2630; :"3k" -> 2640; :"4k" -> 2650;
      :"1q" -> 2660; :"2q" -> 2670; :"3q" -> 2680; :"4q" -> 2690;
      :"1x" -> 5000; :"2x" -> 5001; :"3x" -> 5002; :"4x" -> 5003
      _ ->
        IO.puts("Unrecognized tile #{inspect(tile)}, cannot sort!")
        0
    end
  end
  def sort_tiles(tiles, joker_assignment \\ %{}) do
    tiles
    |> Enum.with_index()
    |> Enum.sort_by(fn {tile, ix} -> sort_value(Map.get(joker_assignment, ix, tile)) end)
    |> Enum.map(fn {tile, _ix} -> tile end)
  end

  # find all jokers that map to the same tile(s) as the given one
  # together with the tile(s) they are connected by
  def apply_tile_aliases(joker, tile_aliases) do
    if is_list(joker) do
      Enum.map(joker, &apply_tile_aliases(&1, tile_aliases))
      |> Enum.reduce(MapSet.new(), &MapSet.union/2)
    else
      {joker_tile, joker_attrs} = to_attr_tile(joker)
      any_tiles = Map.get(tile_aliases, :any, %{}) |> Map.values() |> Enum.concat()
      Map.get(tile_aliases, joker_tile, [])
      |> Enum.filter(fn {attrs, _aliases} -> MapSet.subset?(MapSet.new(attrs), MapSet.new(joker_attrs)) end)
      |> Enum.map(fn {_attrs, aliases} -> MapSet.new(aliases) end)
      |> Enum.reduce(MapSet.new([joker | any_tiles]), &MapSet.union/2)
    end
  end

  # tile1 must have at least the attributes of tile2 (or any of its aliases)
  def same_tile(tile1, tile2, tile_aliases \\ %{}) do
    l1 = strip_attrs(MapSet.new([tile1]))
    l2 = strip_attrs(apply_tile_aliases(tile2, tile_aliases))
    same_id = :any in l1 || :any in l2
    || (:faceup in l2 && Enum.any?(l1, fn tile -> tile not in [:"1x", :"2x", :"3x", :"4x"] end))
    || Enum.any?(l1, fn tile -> tile in l2 end)
    {_, attrs2} = to_attr_tile(tile2)
    attrs_match = has_attr?(tile1, attrs2)
    same_id && attrs_match
  end

  def to_manzu(tile) do
    case tile do
      :"0p" -> :"0m"; :"1p" -> :"1m"; :"2p" -> :"2m"; :"3p" -> :"3m"; :"4p" -> :"4m"; :"5p" -> :"5m"; :"6p" -> :"6m"; :"7p" -> :"7m"; :"8p" -> :"8m"; :"9p" -> :"9m"; :"10p" -> :"10m"
      :"0s" -> :"0m"; :"1s" -> :"1m"; :"2s" -> :"2m"; :"3s" -> :"3m"; :"4s" -> :"4m"; :"5s" -> :"5m"; :"6s" -> :"6m"; :"7s" -> :"7m"; :"8s" -> :"8m"; :"9s" -> :"9m"; :"10s" -> :"10m"
      :"7j" -> :"9j"; :"8j" -> :"9j"; :"17j" -> :"19j"; :"18j" -> :"19j";
      _ -> tile
    end
  end

  def same_number(tile1, tile2, tile_aliases \\ %{}) do
    {t1, attrs1} = to_attr_tile(tile1)
    {t2, attrs2} = to_attr_tile(tile2)
    same_tile({to_manzu(t1), attrs1}, {to_manzu(t2), attrs2}, tile_aliases)
  end

  def count_tiles(hand, tiles, tile_aliases \\ %{}) do
    for hand_tile <- hand do
      if Enum.any?(tiles, &same_tile(hand_tile, &1, tile_aliases)) do 1 else 0 end
    end |> Enum.sum()
  end
  
  # greedy algorithm
  def match_tiles(hand, tiles, tile_aliases \\ %{}, unused \\ [], matches \\ [])
  def match_tiles([], tiles, _tile_aliases, unused, matches), do: {Enum.reverse(unused), tiles, matches}
  def match_tiles([tile | hand], tiles, tile_aliases, unused, matches) do
    case Enum.find_index(tiles, &same_tile(tile, &1, tile_aliases)) do
      nil -> match_tiles(hand, tiles, tile_aliases, [tile | unused], matches)
      i   ->
        {tile2, tiles} = List.pop_at(tiles, i)
        match_tiles(hand, tiles, tile_aliases, unused, [{tile, tile2} | matches])
    end
  end
  
  def next_turn(seat, iterations \\ 1) do
    iterations = rem(iterations, 4)
    next = case seat do
      :east     -> :south
      :south    -> :west
      :west     -> :north
      :north    -> :east
      :self     -> :shimocha
      :shimocha -> :toimen
      :toimen   -> :kamicha
      :kamicha  -> :self
    end
    if iterations <= 0 do seat else next_turn(next, iterations - 1) end
  end
  def prev_turn(seat, iterations \\ 1) do
    iterations = rem(iterations, 4)
    prev = case seat do
      :east     -> :north
      :south    -> :east
      :west     -> :south
      :north    -> :west
      :self     -> :kamicha
      :shimocha -> :self
      :toimen   -> :shimocha
      :kamicha  -> :toimen
    end
    if iterations <= 0 do seat else prev_turn(prev, iterations - 1) end
  end
  
  def get_seat(seat, direction) do
    case direction do
      :shimocha -> next_turn(seat)
      :toimen   -> next_turn(seat, 2)
      :kamicha  -> next_turn(seat, 3)
      :self     -> next_turn(seat, 4)
    end
  end

  def get_relative_seat(seat, seat2) do
    cond do
      seat2 == next_turn(seat)    -> :shimocha
      seat2 == next_turn(seat, 2) -> :toimen
      seat2 == next_turn(seat, 3) -> :kamicha
      seat2 == next_turn(seat, 4) -> :self
    end
  end

  def get_wind_name(wind) do
    case wind do
      :east  -> "東"
      :south -> "南"
      :west  -> "西"
      :north -> "北"
    end
  end

  def to_registry_name(name, ruleset, room_code) do
    name <> "-" <> ruleset <> "-" <> room_code
  end

  def try_integer(value) do
    if value == trunc(value) do trunc(value) else value end
  end

  def half_score_rounded_up(value) do
    # half rounded up to the nearest 100
    nominal = Integer.floor_div(value, 100)
    # floor_div rounds towards -infinity, so this is effectively ceil(nominal/2) * 100
    -Integer.floor_div(-nominal, 2) * 100
  end

  def get_tile_class(tile, i \\ -1, assigns \\ %{}, extra_classes \\ [], animate_played \\ false) do
    id = strip_attrs(tile)
    transparent = has_attr?(tile, ["transparent"])
    inactive = has_attr?(tile, ["inactive"])
    hidden = has_attr?(tile, ["hidden"])
    reversed = transparent && id == :"1x"
    id = if reversed do Riichi.flip_faceup(tile) |> strip_attrs() else id end
    facedown = has_attr?(tile, ["facedown"]) && Map.get(assigns, :hover_index, nil) != i
    played = animate_played && Map.get(assigns, :your_hand?, true) && Map.get(assigns, :preplayed_index, nil) == i
    sideways = i == Map.get(assigns, :riichi_index, nil) && "sideways"
    just_played = Map.get(assigns, :just_discarded?, false) && Map.has_key?(assigns, :pond) && i == length(assigns.pond) - 1
    riichi = Map.has_key?(assigns, :riichi_index) && i == assigns.riichi_index
    [
      "tile", id,
      facedown && "facedown",
      transparent && "transparent",
      inactive && "inactive",
      hidden && "hidden",
      reversed && "reversed",
      played && "played",
      sideways && "sideways",
      just_played && "just-played",
      riichi && "sideways",
    ] ++ extra_classes
  end

  # get the principal tile from a meld consisting of all one tile and jokers
  def _get_joker_meld_tile(tiles, joker_tiles) do
    non_joker_tiles = Enum.reject(tiles, &count_tiles([&1], joker_tiles) > 0)
    has_joker = length(non_joker_tiles) < length(tiles)
    has_nonjoker = length(non_joker_tiles) > 0
    if has_joker && has_nonjoker do
      [tile | rest] = non_joker_tiles
      tile = strip_attrs(tile)
      if Enum.all?(rest, &same_tile(&1, tile)) do tile else nil end
    else nil end
  end
  def get_joker_meld_tile(call, joker_tiles) do
    _get_joker_meld_tile(Riichi.call_to_tiles(call), joker_tiles)
  end

  def replace_jokers(tiles, joker_tiles) do
    if Enum.any?(tiles, &count_tiles([&1], joker_tiles) > 0) do
      List.duplicate(_get_joker_meld_tile(tiles, joker_tiles), length(tiles))
    else tiles end
  end

  @pon_like_calls ["pon", "daiminkan", "kakan", "ankan", "am_pung", "am_kong", "am_quint"]
  def replace_jokers_in_calls(calls, joker_tiles) do
    Enum.map(calls, fn {name, call} ->
      if name in @pon_like_calls && Enum.any?(call, fn {tile, _sideways} -> count_tiles([tile], joker_tiles) > 0 end) do
        meld_tile = get_joker_meld_tile({name, call}, joker_tiles)
        {name, Enum.map(call, fn {_tile, sideways} -> {meld_tile, sideways} end)}
      else {name, call} end
    end)
  end
  
  def maximum_bipartite_matching(adj, pairing \\ %{}, pairing_r \\ %{}) do
    orig_size = map_size(pairing)
    {pairing, pairing_r} = maximum_bipartite_matching_hopcroft_karp_pass(adj, pairing, pairing_r)
    if map_size(pairing) > orig_size do
      maximum_bipartite_matching(adj, pairing, pairing_r)
    else {pairing, pairing_r} end
  end
  defp maximum_bipartite_matching_hopcroft_karp_pass(adj, pairing, pairing_r) do
    start_pts = Map.keys(adj) -- Map.keys(pairing)
    {layers, _, _, _} = Enum.reduce_while(1..map_size(adj), {[], start_pts, MapSet.new(start_pts), MapSet.new()}, fn _, {layers, prev_layer, visited, visited_r} ->
      opp_layer = prev_layer
      |> Enum.flat_map(fn u -> Enum.reject(adj[u], &Map.get(pairing, u) == &1) end)
      |> Enum.uniq()
      |> Enum.reject(& &1 in visited_r)

      new_layer = opp_layer
      |> Enum.map(&Map.get(pairing_r, &1, nil))
      |> Enum.uniq()
      |> Enum.reject(& &1 in visited)

      visited = MapSet.union(visited, MapSet.new(new_layer))
      visited_r = MapSet.union(visited_r, MapSet.new(opp_layer))
      acc = {[MapSet.new(new_layer) | layers], new_layer, visited, visited_r}
      if nil in new_layer || MapSet.size(visited) == map_size(adj) do
        {:halt, acc}
      else
        {:cont, acc}
      end
    end)
    layers = Enum.reverse([MapSet.new() | layers])
    for from <- start_pts, reduce: {pairing, pairing_r} do
      {pairing, pairing_r} ->
        case maximum_bipartite_matching_hopcroft_karp_dfs(from, adj, layers, pairing, pairing_r) do
          {pairing, pairing_r, _layer, true} -> {pairing, pairing_r}
          _                                  -> {pairing, pairing_r}
        end
    end
  end
  defp maximum_bipartite_matching_hopcroft_karp_dfs(nil, _adj, _layers, pairing, pairing_r) do
    {pairing, pairing_r, MapSet.new(), true}
  end
  defp maximum_bipartite_matching_hopcroft_karp_dfs(u, adj, [layer | layers], pairing, pairing_r) do
    Enum.reduce_while(adj[u], {pairing, pairing_r, layer, false}, fn v, {pairing, pairing_r, layer, _found} ->
      case Map.get(pairing_r, v) do
        nil    -> {:halt, {Map.put(pairing, u, v), Map.put(pairing_r, v, u), MapSet.new(), true}}
        next_u ->
          if next_u in layer do
            layer = MapSet.delete(layer, next_u)
            case maximum_bipartite_matching_hopcroft_karp_dfs(next_u, adj, layers, pairing, pairing_r) do
              {pairing, pairing_r, _layer, true} -> {:halt, {Map.put(pairing, u, v), Map.put(pairing_r, v, u), MapSet.new(), true}}
              _                                  -> {:cont, {pairing, pairing_r, layer, false}}
            end
          else {:cont, {pairing, pairing_r, layer, false}} end
      end
    end)
  end
end