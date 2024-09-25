defmodule Riichi do

  @pred %{:"2m"=>:"1m", :"3m"=>:"2m", :"4m"=>:"3m", :"5m"=>:"4m", :"6m"=>:"5m", :"7m"=>:"6m", :"8m"=>:"7m", :"9m"=>:"8m", :"0m"=>:"4m",
          :"2p"=>:"1p", :"3p"=>:"2p", :"4p"=>:"3p", :"5p"=>:"4p", :"6p"=>:"5p", :"7p"=>:"6p", :"8p"=>:"7p", :"9p"=>:"8p", :"0p"=>:"4p",
          :"2s"=>:"1s", :"3s"=>:"2s", :"4s"=>:"3s", :"5s"=>:"4s", :"6s"=>:"5s", :"7s"=>:"6s", :"8s"=>:"7s", :"9s"=>:"8s", :"0s"=>:"4s"}
  @pred_wraps %{:"1m"=>:"9m", :"2m"=>:"1m", :"3m"=>:"2m", :"4m"=>:"3m", :"5m"=>:"4m", :"6m"=>:"5m", :"7m"=>:"6m", :"8m"=>:"7m", :"9m"=>:"8m", :"0m"=>:"4m",
                :"1p"=>:"9p", :"2p"=>:"1p", :"3p"=>:"2p", :"4p"=>:"3p", :"5p"=>:"4p", :"6p"=>:"5p", :"7p"=>:"6p", :"8p"=>:"7p", :"9p"=>:"8p", :"0p"=>:"4p",
                :"1s"=>:"9s", :"2s"=>:"1s", :"3s"=>:"2s", :"4s"=>:"3s", :"5s"=>:"4s", :"6s"=>:"5s", :"7s"=>:"6s", :"8s"=>:"7s", :"9s"=>:"8s", :"0s"=>:"4s"}
  def pred(tile, wraps \\ false) do
    if wraps do @pred_wraps[tile] else @pred[tile] end
  end

  @succ %{:"1m"=>:"2m", :"2m"=>:"3m", :"3m"=>:"4m", :"4m"=>:"5m", :"5m"=>:"6m", :"6m"=>:"7m", :"7m"=>:"8m", :"8m"=>:"9m", :"0m"=>:"6m",
          :"1p"=>:"2p", :"2p"=>:"3p", :"3p"=>:"4p", :"4p"=>:"5p", :"5p"=>:"6p", :"6p"=>:"7p", :"7p"=>:"8p", :"8p"=>:"9p", :"0p"=>:"6p",
          :"1s"=>:"2s", :"2s"=>:"3s", :"3s"=>:"4s", :"4s"=>:"5s", :"5s"=>:"6s", :"6s"=>:"7s", :"7s"=>:"8s", :"8s"=>:"9s", :"0s"=>:"6s"}
  @succ_wraps %{:"1m"=>:"2m", :"2m"=>:"3m", :"3m"=>:"4m", :"4m"=>:"5m", :"5m"=>:"6m", :"6m"=>:"7m", :"7m"=>:"8m", :"8m"=>:"9m", :"9m"=>:"1m", :"0m"=>:"6m",
                :"1p"=>:"2p", :"2p"=>:"3p", :"3p"=>:"4p", :"4p"=>:"5p", :"5p"=>:"6p", :"6p"=>:"7p", :"7p"=>:"8p", :"8p"=>:"9p", :"9p"=>:"1p", :"0p"=>:"6p",
                :"1s"=>:"2s", :"2s"=>:"3s", :"3s"=>:"4s", :"4s"=>:"5s", :"5s"=>:"6s", :"6s"=>:"7s", :"7s"=>:"8s", :"8s"=>:"9s", :"9s"=>:"1s", :"0s"=>:"6s"}
  def succ(tile, wraps \\ false) do
    if wraps do @succ_wraps[tile] else @succ[tile] end
  end

  @pred_honors %{:"2m"=>:"1m", :"3m"=>:"2m", :"4m"=>:"3m", :"5m"=>:"4m", :"6m"=>:"5m", :"7m"=>:"6m", :"8m"=>:"7m", :"9m"=>:"8m", :"0m"=>:"4m",
                 :"2p"=>:"1p", :"3p"=>:"2p", :"4p"=>:"3p", :"5p"=>:"4p", :"6p"=>:"5p", :"7p"=>:"6p", :"8p"=>:"7p", :"9p"=>:"8p", :"0p"=>:"4p",
                 :"2s"=>:"1s", :"3s"=>:"2s", :"4s"=>:"3s", :"5s"=>:"4s", :"6s"=>:"5s", :"7s"=>:"6s", :"8s"=>:"7s", :"9s"=>:"8s", :"0s"=>:"4s",
                 :"2z"=>:"1z", :"3z"=>:"2z", :"4z"=>:"3z", :"6z"=>:"5z", :"7z"=>:"6z"}
  @pred_honors_wraps %{:"2m"=>:"1m", :"3m"=>:"2m", :"4m"=>:"3m", :"5m"=>:"4m", :"6m"=>:"5m", :"7m"=>:"6m", :"8m"=>:"7m", :"9m"=>:"8m", :"0m"=>:"4m",
                       :"2p"=>:"1p", :"3p"=>:"2p", :"4p"=>:"3p", :"5p"=>:"4p", :"6p"=>:"5p", :"7p"=>:"6p", :"8p"=>:"7p", :"9p"=>:"8p", :"0p"=>:"4p",
                       :"2s"=>:"1s", :"3s"=>:"2s", :"4s"=>:"3s", :"5s"=>:"4s", :"6s"=>:"5s", :"7s"=>:"6s", :"8s"=>:"7s", :"9s"=>:"8s", :"0s"=>:"4s",
                       :"1z"=>:"4z", :"2z"=>:"1z", :"3z"=>:"2z", :"4z"=>:"3z", :"5z"=>:"7z", :"6z"=>:"5z", :"7z"=>:"6z"}
  def pred_honors(tile, wraps \\ false) do
    if wraps do @pred_honors_wraps[tile] else @pred_honors[tile] end
  end

  @succ_honors %{:"1m"=>:"2m", :"2m"=>:"3m", :"3m"=>:"4m", :"4m"=>:"5m", :"5m"=>:"6m", :"6m"=>:"7m", :"7m"=>:"8m", :"8m"=>:"9m", :"0m"=>:"6m",
                 :"1p"=>:"2p", :"2p"=>:"3p", :"3p"=>:"4p", :"4p"=>:"5p", :"5p"=>:"6p", :"6p"=>:"7p", :"7p"=>:"8p", :"8p"=>:"9p", :"0p"=>:"6p",
                 :"1s"=>:"2s", :"2s"=>:"3s", :"3s"=>:"4s", :"4s"=>:"5s", :"5s"=>:"6s", :"6s"=>:"7s", :"7s"=>:"8s", :"8s"=>:"9s", :"0s"=>:"6s",
                 :"1z"=>:"2z", :"2z"=>:"3z", :"3z"=>:"4z", :"5z"=>:"6z", :"6z"=>:"7z"}
  @succ_honors_wraps %{:"1m"=>:"2m", :"2m"=>:"3m", :"3m"=>:"4m", :"4m"=>:"5m", :"5m"=>:"6m", :"6m"=>:"7m", :"7m"=>:"8m", :"8m"=>:"9m", :"0m"=>:"6m",
                       :"1p"=>:"2p", :"2p"=>:"3p", :"3p"=>:"4p", :"4p"=>:"5p", :"5p"=>:"6p", :"6p"=>:"7p", :"7p"=>:"8p", :"8p"=>:"9p", :"0p"=>:"6p",
                       :"1s"=>:"2s", :"2s"=>:"3s", :"3s"=>:"4s", :"4s"=>:"5s", :"5s"=>:"6s", :"6s"=>:"7s", :"7s"=>:"8s", :"8s"=>:"9s", :"0s"=>:"6s",
                       :"1z"=>:"2z", :"2z"=>:"3z", :"3z"=>:"4z", :"4z"=>:"1z", :"5z"=>:"6z", :"6z"=>:"7z", :"7z"=>:"5z"}
  def succ_honors(tile, wraps \\ false) do
    if wraps do @succ_honors_wraps[tile] else @succ_honors[tile] end
  end
  def dora(tile), do: @succ_honors_wraps[tile]

  @terminal_honors [:"1m",:"9m",:"1p",:"9p",:"1s",:"9s",:"1z",:"2z",:"3z",:"4z",:"5z",:"6z",:"7z"]
  @all_tiles [
    :"1m",:"2m",:"3m",:"4m",:"5m",:"6m",:"7m",:"8m",:"9m",
    :"1p",:"2p",:"3p",:"4p",:"5p",:"6p",:"7p",:"8p",:"9p",
    :"1s",:"2s",:"3s",:"4s",:"5s",:"6s",:"7s",:"8s",:"9s",
    :"1z",:"2z",:"3z",:"4z",:"5z",:"6z",:"7z"
  ]

  def offset_tile(tile, n, wraps \\ false, honor_seqs \\ false) do
    if tile != nil do
      if (n < 1 && n > -1) || n < -10 || n > 10 do
        normalize_red_five(tile)
      else
        if n < 0 do
          offset_tile(if honor_seqs do pred_honors(tile, wraps) else pred(tile, wraps) end, n+1, wraps, honor_seqs)
        else
          offset_tile(if honor_seqs do succ_honors(tile, wraps) else succ(tile, wraps) end, n-1, wraps, honor_seqs)
        end
      end
    else nil end
  end

  def to_red(tile) do
    case tile do
      :"5m" -> :"0m"
      :"5p" -> :"0p"
      :"5s" -> :"0s"
      _     -> nil
    end
  end

  def normalize_red_five(tile) do
    case tile do
      :"0m" -> :"5m"
      :"0p" -> :"5p"
      :"0s" -> :"5s"
      t    -> t
    end
  end
  def normalize_red_fives(hand), do: Enum.map(hand, &normalize_red_five/1)

  def is_manzu?(tile), do: tile in [:"1m", :"2m", :"3m", :"4m", :"5m", :"6m", :"7m", :"8m", :"9m", :"0m"]
  def is_pinzu?(tile), do: tile in [:"1p", :"2p", :"3p", :"4p", :"5p", :"6p", :"7p", :"8p", :"9p", :"0p"]
  def is_souzu?(tile), do: tile in [:"1s", :"2s", :"3s", :"4s", :"5s", :"6s", :"7s", :"8s", :"9s", :"0s"]
  def is_jihai?(tile), do: tile in [:"1z", :"2z", :"3z", :"4z", :"5z", :"6z", :"7z"]
  def is_suited?(tile), do: is_manzu?(tile) || is_pinzu?(tile) || is_souzu?(tile)
  def is_terminal?(tile), do: tile in [:"1m", :"9m", :"1p", :"9p", :"1s", :"9s"]
  def is_yaochuuhai?(tile), do: tile in [:"1m", :"9m", :"1p", :"9p", :"1s", :"9s", :"1z", :"2z", :"3z", :"4z", :"5z", :"6z", :"7z"]
  def is_tanyaohai?(tile), do: tile not in [:"1m", :"9m", :"1p", :"9p", :"1s", :"9s", :"1z", :"2z", :"3z", :"4z", :"5z", :"6z", :"7z"]
  def is_num?(tile, num) do
    tile in case num do
      1 -> [:"1m", :"1p", :"1s"]
      2 -> [:"2m", :"2p", :"2s"]
      3 -> [:"3m", :"3p", :"3s"]
      4 -> [:"4m", :"4p", :"4s"]
      5 -> [:"5m", :"5p", :"5s", :"0m", :"0p", :"0s"]
      6 -> [:"6m", :"6p", :"6s"]
      7 -> [:"7m", :"7p", :"7s"]
      8 -> [:"8m", :"8p", :"8s"]
      9 -> [:"9m", :"9p", :"9s"]
    end
  end
  def same_suit?(tile, tile2) do
    cond do
      is_manzu?(tile) -> is_manzu?(tile2)
      is_pinzu?(tile) -> is_pinzu?(tile2)
      is_souzu?(tile) -> is_souzu?(tile2)
      is_jihai?(tile) -> is_jihai?(tile2)
      true            -> false
    end
  end

  # return all possible calls of each tile in called_tiles, given hand
  # includes returning multiple choices for red fives
  # if called_tiles is an empty list, then we choose from our hand
  # example: %{:"5m" => [[:"4m", :"6m"], [:"6m", :"7m"]]}
  def make_calls(calls_spec, hand, called_tiles \\ [], _tile_mappings \\ %{}, wraps \\ false, honor_seqs \\ false) do
    # IO.puts("#{inspect(calls_spec)} / #{inspect(hand)} / #{inspect(called_tiles)}")
    from_hand = Enum.empty?(called_tiles)
    call_choices = if from_hand do hand else called_tiles end
    Map.new(call_choices, fn tile ->
      {tile, Enum.flat_map(calls_spec, fn call_spec ->
        hand = if from_hand do List.delete(hand, tile) else hand end
        other_tiles = Enum.map(call_spec, &offset_tile(tile, &1, wraps, honor_seqs))
        {_, choices} = Enum.reduce(other_tiles, {hand, []}, fn t, {remaining_hand, tiles} ->
          exists = Enum.member?(remaining_hand, t)
          red_exists = Enum.member?(remaining_hand, to_red(t))
          {List.delete(remaining_hand, if red_exists do to_red(t) else t end),
           [(if exists do [t] else [] end) ++ (if red_exists do [to_red(t)] else [] end) | tiles]}
        end)
        # take the cartesian product of tile choices to get all choice sets
        result = choices
               |> Enum.reduce([[]], fn cs, accs -> for choice <- cs, acc <- accs, do: acc ++ [choice] end)
               |> Enum.map(fn tiles -> Utils.sort_tiles(tiles) end)
               |> Enum.uniq()
        result
      end) |> Enum.uniq()}
    end)
  end
  def can_call?(calls_spec, hand, called_tiles \\ [], tile_mappings \\ %{}, wraps \\ false, honor_seqs \\ false), do: Enum.any?(make_calls(calls_spec, hand, called_tiles, tile_mappings, wraps, honor_seqs), fn {_tile, choices} -> not Enum.empty?(choices) end)

  def try_remove_all_tiles(hand, tiles, tile_aliases \\ %{})
  def try_remove_all_tiles(hand, [], _tile_aliases), do: [hand]
  def try_remove_all_tiles(hand, [tile | tiles], tile_aliases) do
    aliases = if Map.has_key?(tile_aliases, tile) do tile_aliases[tile] else [] end
    for t <- [tile] ++ aliases do
      removed = List.delete(hand, t)
      if length(removed) == length(hand) do [] else try_remove_all_tiles(removed, tiles, tile_aliases) end
    end |> Enum.concat()
  end

  def remove_from_hand_calls(hand, tiles, calls, tile_aliases \\ %{}) do
    # from hand
    from_hand = try_remove_all_tiles(hand, tiles, tile_aliases) |> Enum.map(fn hand -> {hand, calls} end)

    # from calls
    matching_indices = calls |> Enum.map(&call_to_tiles/1) |> Enum.with_index() |> Enum.flat_map(fn {call, i} ->
      case try_remove_all_tiles(call, tiles, tile_aliases) do
        [] -> []
        _  -> [i]
      end
    end)
    from_calls = Enum.map(matching_indices, fn i -> {hand, List.delete_at(calls, i)} end)
    from_hand ++ from_calls |> Enum.uniq()
  end

  def try_remove_call(hand, calls, call_name) do
    ix = Enum.find_index(calls, fn {name, _call} -> name == call_name end)
    if ix != nil do [{hand, List.delete_at(calls, ix)}] else [] end
  end

  def add_tile_aliases(tiles, tile_aliases) do
    Enum.flat_map(tiles, fn tile ->
      [tile] ++ Enum.flat_map(tile_aliases, fn {from, to_tiles} ->
        if tile in to_tiles do [from] else [] end
      end)
    end)
  end

  def remove_group(hand, calls, group, tile_aliases \\ %{}, wrapping \\ false, honor_seqs \\ false) do
    # IO.puts("removing group #{inspect(group)} from hand #{inspect(hand)}")
    cond do
      is_list(group) && not Enum.empty?(group) ->
        if Enum.all?(group, fn tile -> Utils.to_tile(tile) != nil end) do
          # list of tiles
          tiles = Enum.map(group, fn tile -> Utils.to_tile(tile) end)
          remove_from_hand_calls(hand, tiles, calls, tile_aliases)
        else
          # list of integers specifying a group of tiles
          all_tiles = hand ++ Enum.flat_map(calls, &call_to_tiles/1)
          |> add_tile_aliases(tile_aliases)
          all_tiles |> Enum.uniq() |> Enum.flat_map(fn base_tile ->
            tiles = Enum.map(group, fn tile_or_offset -> if Utils.to_tile(tile_or_offset) != nil do Utils.to_tile(tile_or_offset) else offset_tile(base_tile, tile_or_offset, wrapping, honor_seqs) end end)
            remove_from_hand_calls(hand, tiles, calls, tile_aliases)
          end)
        end
      # tile
      Utils.to_tile(group) != nil -> 
        if Enum.member?(hand, Utils.to_tile(group)) do
          [{List.delete(hand, Utils.to_tile(group)), calls}]
        else
          []
        end
      # call
      is_binary(group) -> try_remove_call(hand, calls, group)
      true ->
        IO.puts("Unhandled group #{inspect(group)}")
        []
    end
  end

  defp _remove_hand_definition(hand, calls, hand_definition, tile_aliases, wrapping, honor_seqs) do
    Enum.reduce(hand_definition, [{hand, calls}, {normalize_red_fives(hand), calls}], fn [groups, num], all_hands ->
      Enum.reduce(1..num, all_hands, fn _, hands ->
        for {hand, calls} <- hands, group <- groups do
          remove_group(hand, calls, group, tile_aliases, wrapping, honor_seqs)
        end |> Enum.concat()
      end) |> Enum.uniq_by(fn {hand, calls} -> {Enum.sort(hand), calls} end)
    end)
  end

  def remove_hand_definition(hand, calls, hand_definition, tile_aliases \\ %{}, wrapping \\ false, honor_seqs \\ false) do
    # calls = Enum.map(calls, fn {name, call} -> {name, Enum.map(call, fn {tile, _sideways} -> tile end)} end)
    case RiichiAdvanced.ETSCache.get({:remove_hand_definition, hand, calls, hand_definition, tile_aliases, wrapping, honor_seqs}) do
      [] -> 
        result = _remove_hand_definition(hand, calls, hand_definition, tile_aliases, wrapping, honor_seqs)
        RiichiAdvanced.ETSCache.put({:remove_hand_definition, hand, calls, hand_definition, tile_aliases, wrapping, honor_seqs}, result)
        # IO.puts("Results:\n  hand: #{inspect(hand)}\n  result: #{inspect(result)}")
        result
      [result] -> result
    end
  end

  # check if hand contains all groups in each definition in hand_definitions
  defp _check_hand(hand, calls, hand_definitions, tile_aliases, wrapping, honor_seqs) do
    Enum.any?(hand_definitions, fn hand_definition -> not Enum.empty?(remove_hand_definition(hand, calls, hand_definition, tile_aliases, wrapping, honor_seqs)) end)
  end

  def check_hand(hand, calls, hand_definitions, tile_aliases \\ %{}, wrapping \\ false, honor_seqs \\ false) do
    case RiichiAdvanced.ETSCache.get({:check_hand, hand, calls, hand_definitions, tile_aliases, wrapping, honor_seqs}) do
      [] -> 
        result = _check_hand(hand, calls, hand_definitions, tile_aliases, wrapping, honor_seqs)
        RiichiAdvanced.ETSCache.put({:check_hand, hand, calls, hand_definitions, tile_aliases, wrapping, honor_seqs}, result)
        # IO.puts("Results:\n  hand: #{inspect(hand)}\n  hand_definitions: #{inspect(hand_definitions)}\n  result: #{inspect(result)}")
        result
      [result] -> result
    end
  end

  def match_hand(hand, calls, match_definitions, tile_aliases \\ %{}, wrapping \\ false, honor_seqs \\ false) do
    # TODO replace check_hand
    check_hand(hand, calls, match_definitions, tile_aliases, wrapping, honor_seqs)
  end

  def get_waits(hand, calls, match_definitions, tile_aliases \\ %{}, wrapping \\ false, honor_seqs \\ false) do
    Enum.filter(@all_tiles, fn tile -> match_hand(hand ++ [tile], calls, match_definitions, tile_aliases, wrapping, honor_seqs) end)
  end

  # only keeps one version of the hand (assumes groups don't overlap)
  defp remove_hand_definition_simple(hand, calls, hand_definition, tile_aliases) do
    Enum.reduce(hand_definition, [{hand, calls}], fn [groups, num], hand_calls ->
      Enum.reduce(1..num, hand_calls, fn _, hand_calls ->
        case hand_calls do
          [{hand, calls}] -> for group <- groups do
            remove_group(hand, calls, group, tile_aliases)
          end |> Enum.concat() |> Enum.take(1)
          [] -> []
        end
      end)
    end)
  end

  def match_hand_simple(hand, calls, match_definitions, tile_aliases \\ %{}) do
    Enum.any?(match_definitions, fn match_definition ->
      removed = remove_hand_definition_simple(hand, calls, match_definition, tile_aliases)
      removed2 = remove_hand_definition_simple(normalize_red_fives(hand), calls, match_definition, tile_aliases)
      not Enum.empty?(removed ++ removed2)
    end)
  end

  def tile_matches(tile_specs, context) do
    Enum.any?(tile_specs, &case &1 do
      "any" -> true
      "same" -> normalize_red_five(context.tile) == normalize_red_five(context.tile2)
      "not_same" -> normalize_red_five(context.tile) != normalize_red_five(context.tile2)
      "manzu" -> is_manzu?(context.tile)
      "pinzu" -> is_pinzu?(context.tile)
      "souzu" -> is_souzu?(context.tile)
      "jihai" -> is_jihai?(context.tile)
      "terminal" -> is_terminal?(context.tile)
      "yaochuuhai" -> is_yaochuuhai?(context.tile)
      "tanyaohai" -> is_tanyaohai?(context.tile)
      "1" -> is_num?(context.tile, 1)
      "2" -> is_num?(context.tile, 2)
      "3" -> is_num?(context.tile, 3)
      "4" -> is_num?(context.tile, 4)
      "5" -> is_num?(context.tile, 5)
      "6" -> is_num?(context.tile, 6)
      "7" -> is_num?(context.tile, 7)
      "8" -> is_num?(context.tile, 8)
      "9" -> is_num?(context.tile, 9)
      "not_kuikae" ->
        tiles_called = normalize_red_fives(context.call.other_tiles)
        case tiles_called do
          [tile1, tile2] ->
            cond do
              succ(tile1) == tile2 && context.tile == pred(tile1) -> context.tile2 != succ(tile2)
              succ(tile1) == tile2 && context.tile == succ(tile2) -> context.tile2 != pred(tile1)
              true -> true
            end
          _ -> true
        end
      _   ->
        # "1m", "2z" are also specs
        if Utils.to_tile(&1) != nil do
          context.tile == Utils.to_tile(&1)
        else
          IO.puts("Unhandled tile spec #{inspect(&1)}")
          true
        end
    end)
  end

  def not_needed_for_hand(hand, calls, tile, hand_definitions, tile_aliases \\ %{}, wraps \\ false, honor_seqs \\ false) do
    Enum.any?(hand_definitions, fn hand_definition ->
      removed = remove_hand_definition(hand, calls, hand_definition, tile_aliases, wraps, honor_seqs)
      normalize_red_five(tile) in Enum.concat(Enum.map(removed, fn {hand, _calls} -> hand end))
    end)
  end

  def call_to_tiles({_name, call}) do
    if {:"1x", false} in call do
      # TODO support more than just ankan
      {red, _} = Enum.at(call, 1)
      {nored, _} = Enum.at(call, 2)
      [red, nored, nored, nored]
    else
      Enum.map(call, fn {tile, _sideways} -> tile end)
    end
  end

  def get_round_wind(kyoku) do
    cond do
      kyoku >= 0 && kyoku < 4 -> :east
      kyoku >= 4 && kyoku < 8 -> :south
      kyoku >= 8 && kyoku < 12 -> :west
      kyoku >= 12 -> :north
    end
  end

  def get_seat_wind(kyoku, seat) do
    Utils.prev_turn(seat, rem(kyoku, 4))
  end

  def get_player_from_seat_wind(kyoku, wind) do
    Utils.next_turn(wind, rem(kyoku, 4))
  end

  def get_east_player_seat(kyoku) do
    Utils.next_turn(:east, rem(kyoku, 4))
  end

  def get_seat_scoring_offset(kyoku, seat) do
    case get_seat_wind(kyoku, seat) do
      :east  -> 3
      :south -> 2
      :west  -> 1
      :north -> 0
    end
  end

  defp calculate_call_fu({name, call}) do
    {relevant_tile, _sideways} = Enum.at(call, 1) # avoids the initial 1x from ankan
    case name do
      "chii"  -> 0
      "pon"   -> if relevant_tile in @terminal_honors do 4 else 2 end
      "ankan" -> if relevant_tile in @terminal_honors do 32 else 16 end
      _       -> if relevant_tile in @terminal_honors do 16 else 8 end
    end
  end

  defp calculate_pair_fu(tile, seat_wind, round_wind) do
    fu = case tile do
      :"1z" -> if :east in [seat_wind, round_wind] do 2 else 0 end
      :"2z" -> if :south in [seat_wind, round_wind] do 2 else 0 end
      :"3z" -> if :west in [seat_wind, round_wind] do 2 else 0 end
      :"4z" -> if :north in [seat_wind, round_wind] do 2 else 0 end
      :"5z" -> 2
      :"6z" -> 2
      :"7z" -> 2
      _     -> 0
    end
    # double wind 4 fu
    fu = if fu == 2 && tile in [:"1z", :"2z", :"3z", :"4z"] && seat_wind == round_wind do 4 else fu end
    fu
  end

  def calculate_fu(starting_hand, calls, winning_tile, win_source, seat_wind, round_wind, tile_aliases \\ %{}, wraps \\ false) do
    starting_hand = normalize_red_fives(starting_hand)
    winning_tile = normalize_red_five(winning_tile)
    num_pairs = Enum.frequencies(starting_hand ++ [winning_tile]) |> Map.values |> Enum.count(& &1 == 2)
    # initial fu
    fu = case win_source do
      :draw -> 22
      _     -> if Enum.all?(calls, fn {name, _call} -> name == "ankan" end) do 30 else 20 end
    end

    # add called triplets
    fu = fu + (Enum.map(calls, &calculate_call_fu/1) |> Enum.sum)

    possible_penchan_removed = if not wraps do
      case winning_tile do
        :"3m" -> try_remove_all_tiles(starting_hand, [:"1m", :"2m"], tile_aliases)
        :"7m" -> try_remove_all_tiles(starting_hand, [:"8m", :"9m"], tile_aliases)
        :"3p" -> try_remove_all_tiles(starting_hand, [:"1p", :"2p"], tile_aliases)
        :"7p" -> try_remove_all_tiles(starting_hand, [:"8p", :"9p"], tile_aliases)
        :"3s" -> try_remove_all_tiles(starting_hand, [:"1s", :"2s"], tile_aliases)
        :"7s" -> try_remove_all_tiles(starting_hand, [:"8s", :"9s"], tile_aliases)
        :"2z" -> if wraps do [] else try_remove_all_tiles(starting_hand, [:"3z", :"4z"], tile_aliases) end
        :"3z" -> if wraps do [] else try_remove_all_tiles(starting_hand, [:"1z", :"2z"], tile_aliases) end
        _     -> []
      end |> Enum.map(fn hand -> {hand, fu+2} end)
    else [] end
    middle_tiles = [:"2m", :"3m", :"4m", :"5m", :"6m", :"7m", :"8m", :"2p", :"3p", :"4p", :"5p", :"6p", :"7p", :"8p", :"2s", :"3s", :"4s", :"5s", :"6s", :"7s", :"8s", :"2z", :"3z", :"6z"]
    all_tiles = middle_tiles ++ [:"1m", :"9m", :"1p", :"9p", :"1s", :"9s", :"1z", :"4z", :"5z", :"7z"]
    kanchan_tiles = if wraps do all_tiles else middle_tiles end
    possible_kanchan_removed = if winning_tile in kanchan_tiles do
      try_remove_all_tiles(starting_hand, [offset_tile(winning_tile, -1, wraps, true), offset_tile(winning_tile, 1, wraps, true)], tile_aliases)
      |> Enum.map(fn hand -> {hand, fu+2} end)
    else [] end
    possible_left_ryanmen_removed = if offset_tile(winning_tile, -3, wraps, true) != nil do
      try_remove_all_tiles(starting_hand, [offset_tile(winning_tile, -2, wraps, true), offset_tile(winning_tile, -1, wraps, true)], tile_aliases)
      |> Enum.map(fn hand -> {hand, fu} end)
    else [] end
    possible_right_ryanmen_removed = if offset_tile(winning_tile, 3, wraps, true) != nil do
      try_remove_all_tiles(starting_hand, [offset_tile(winning_tile, 1, wraps, true), offset_tile(winning_tile, 2, wraps, true)], tile_aliases)
      |> Enum.map(fn hand -> {hand, fu} end)
    else [] end
    hands_fu = possible_penchan_removed ++ possible_kanchan_removed ++ possible_left_ryanmen_removed ++ possible_right_ryanmen_removed ++ [{starting_hand, fu}]

    # from these hands, remove all triplets and add the according amount of closed triplet fu
    hands_fu = for _ <- 1..4, reduce: hands_fu do
      all_hands ->
        Enum.flat_map(all_hands, fn {hand, fu} ->
          hand |> Enum.uniq() |> add_tile_aliases(tile_aliases) |> Enum.flat_map(fn base_tile ->
            case try_remove_all_tiles(hand, [base_tile, base_tile, base_tile], tile_aliases) do
              [] -> [{hand, fu}]
              removed -> Enum.map(removed, fn hand -> {hand, fu + if base_tile in @terminal_honors do 8 else 4 end} end)
            end
          end) |> Enum.uniq()
        end) |> Enum.uniq()
    end

    # now remove all sequences (no increase in fu)
    hands_fu = for _ <- 1..4, reduce: hands_fu do
      all_hands ->
        Enum.flat_map(all_hands, fn {hand, fu} ->
          normal = hand |> Enum.uniq() |> add_tile_aliases(tile_aliases) |> Enum.flat_map(fn base_tile -> 
            case try_remove_all_tiles(hand, [offset_tile(base_tile, -1, wraps, true), base_tile, offset_tile(base_tile, 1, wraps, true)], tile_aliases) do
              [] -> [{hand, fu}]
              removed -> Enum.map(removed, fn hand -> {hand, fu} end)
            end
          end)

          # the following are for Senoo Kaori (should not affect normal hands)
          sk = try_remove_all_tiles(hand, [:"1z", :"2z", :"3z"], tile_aliases)
            ++ try_remove_all_tiles(hand, [:"2z", :"3z", :"4z"], tile_aliases)
            ++ try_remove_all_tiles(hand, [:"5z", :"6z", :"7z"], tile_aliases)
            |> Enum.map(fn hand -> {hand, fu} end)

          normal ++ sk
        end) |> Enum.uniq()
    end

    # IO.inspect(hands_fu)

    # only valid hands should either have:
    # - one tile remaining (tanki)
    # - one pair remaining (standard)
    # - two pairs remaining (shanpon)
    winning_tiles = add_tile_aliases([winning_tile], tile_aliases)
    fus = Enum.flat_map(hands_fu, fn {hand, fu} ->
      num_pairs = Enum.frequencies(hand) |> Map.values |> Enum.count(& &1 == 2)
      cond do
        length(hand) == 1 && Enum.at(hand, 0) in winning_tiles -> [fu + 2 + calculate_pair_fu(Enum.at(hand, 0), seat_wind, round_wind)]
        length(hand) == 2 && num_pairs == 1                    -> [fu + calculate_pair_fu(Enum.at(hand, 0), seat_wind, round_wind)]
        length(hand) == 4 && num_pairs == 2                    ->
          [tile1, tile2] = Enum.uniq(hand)
          if tile1 in winning_tiles do
            [fu + calculate_pair_fu(tile2, seat_wind, round_wind) + (if tile1 in @terminal_honors do 4 else 2 end * if win_source == :draw do 2 else 1 end)]
          else
            [fu + calculate_pair_fu(tile1, seat_wind, round_wind) + (if tile2 in @terminal_honors do 4 else 2 end * if win_source == :draw do 2 else 1 end)]
          end
        true                                                   -> []
      end
    end)
    fu = if Enum.empty?(fus) do 0 else Enum.max(fus) end

    # if we can get (closed) pinfu, we should
    closed_pinfu_fu = if win_source == :draw do 22 else 30 end
    fu = if closed_pinfu_fu in fus do closed_pinfu_fu else fu end

    # if it's kokushi, 30 fu
    kokushi_tiles = [:"1m", :"9m", :"1p", :"9p", :"1s", :"9s", :"1z", :"2z", :"3z", :"4z", :"5z", :"6z", :"7z"]
    fu = case try_remove_all_tiles(starting_hand ++ [winning_tile], kokushi_tiles, tile_aliases) do
      [] -> fu
      _  -> 30
    end

    # IO.inspect(fu)

    # closed pinfu is 20 tsumo/30 ron, open pinfu is 30, chiitoitsu is 25
    cond do
      fu == 22 && win_source == :draw && Enum.empty?(calls) -> 20
      fu == 30 && win_source != :draw && Enum.empty?(calls) -> 30
      fu == 20 && not Enum.empty?(calls)                    -> 30
      Enum.empty?(fus) && num_pairs == 7                    -> 25
      true                                                  ->
        # round up to nearest 10
        remainder = rem(fu, 10)
        if remainder == 0 do fu else fu - remainder + 10 end
    end
  end

  def calc_ko_oya_points(score, is_dealer) do
    divisor = if is_dealer do 3 else 4 end
    ko_payment = trunc(Float.round(score / divisor / 100) * 100)
    num_ko_payers = if is_dealer do 3 else 2 end
    oya_payment = score - num_ko_payers * ko_payment
    {ko_payment, oya_payment}
  end

  def count_ukeire(waits, hand, visible_ponds, visible_calls, winning_tile) do
    all_tiles = hand ++ visible_ponds ++ Enum.flat_map(visible_calls, &call_to_tiles/1) -- [winning_tile]
    waits
    |> Enum.map(fn wait -> 4 - Enum.count(all_tiles, fn tile -> normalize_red_five(tile) == normalize_red_five(wait) end) end)
    |> Enum.sum()
  end

end
