defmodule RiichiAdvancedWeb.GameLive do
  use RiichiAdvancedWeb, :live_view

  # This function initializes the state
  def mount(_params, _session, socket) do
    socket = assign(socket, :winner, nil)
    # liveviews mount twice
    if socket.root_pid != nil do
      Phoenix.PubSub.subscribe(RiichiAdvanced.PubSub, "game:main")

      [turn, players, seat, shimocha, toimen, kamicha] = RiichiAdvanced.GlobalState.new_player(socket)

      socket = assign(socket, :loading, false)
      socket = assign(socket, :player_id, socket.id)
      socket = assign(socket, :turn, turn)
      socket = assign(socket, :seat, seat)
      socket = assign(socket, :shimocha, shimocha)
      socket = assign(socket, :toimen, toimen)
      socket = assign(socket, :kamicha, kamicha)
      socket = assign(socket, :hands, Map.new(players, fn {seat, player} -> {seat, player.hand} end))
      socket = assign(socket, :ponds, Map.new(players, fn {seat, player} -> {seat, player.pond} end))
      socket = assign(socket, :calls, Map.new(players, fn {seat, player} -> {seat, player.calls} end))
      socket = assign(socket, :draws, Map.new(players, fn {seat, player} -> {seat, player.draw} end))
      socket = assign(socket, :buttons, Map.new(players, fn {seat, player} -> {seat, player.buttons} end))
      socket = assign(socket, :call_buttons, Map.new(players, fn {seat, player} -> {seat, player.call_buttons} end))
      socket = assign(socket, :call_name, Map.new(players, fn {seat, player} -> {seat, player.call_name} end))
      socket = assign(socket, :riichi, Map.new(players, fn {seat, player} -> {seat, player.riichi} end))
      socket = assign(socket, :big_text, Map.new(players, fn {seat, player} -> {seat, player.big_text} end))
      {:ok, socket}
    else
      empty_bools = %{:east => false, :south => false, :west => false, :north => false}
      empty_lists = %{:east => [], :south => [], :west => [], :north => []}
      empty_maps = %{:east => %{}, :south => %{}, :west => %{}, :north => %{}}
      empty_strs = %{:east => "", :south => "", :west => "", :north => ""}
      socket = assign(socket, :loading, true)
      socket = assign(socket, :seat, :east)
      socket = assign(socket, :turn, :east)
      socket = assign(socket, :shimocha, nil)
      socket = assign(socket, :toimen, nil)
      socket = assign(socket, :kamicha, nil)
      socket = assign(socket, :hands, empty_lists)
      socket = assign(socket, :ponds, empty_lists)
      socket = assign(socket, :calls, empty_lists)
      socket = assign(socket, :draws, empty_lists)
      socket = assign(socket, :buttons, empty_lists)
      socket = assign(socket, :call_buttons, empty_maps)
      socket = assign(socket, :call_name, empty_strs)
      socket = assign(socket, :riichi, empty_bools)
      socket = assign(socket, :big_text, empty_strs)
      {:ok, socket}
    end
  end

  # Render the template using the assigned state
  def render(assigns) do
    ~H"""
    <.live_component module={RiichiAdvancedWeb.HandComponent}
      id="hand self"
      your_hand?={true}
      your_turn?={@seat == @turn}
      seat={@seat}
      hand={@hands[@seat]}
      draw={@draws[@seat]}
      calls={@calls[@seat]}
      play_tile={&send(self(), {:play_tile, &1, &2})}
      reindex_hand={&send(self(), {:reindex_hand, &1, &2})}
      />
    <.live_component module={RiichiAdvancedWeb.PondComponent} id="pond self" pond={@ponds[@seat]} />
    <.live_component module={RiichiAdvancedWeb.HandComponent}
      id="hand shimocha"
      your_hand?={false}
      seat={@shimocha}
      hand={@hands[@shimocha]}
      draw={@draws[@shimocha]}
      calls={@calls[@shimocha]}
      :if={@shimocha != nil}
      />
    <.live_component module={RiichiAdvancedWeb.PondComponent} id="pond shimocha" pond={@ponds[@shimocha]} :if={@shimocha != nil} />
    <.live_component module={RiichiAdvancedWeb.HandComponent}
      id="hand toimen"
      your_hand?={false}
      seat={@toimen}
      hand={@hands[@toimen]}
      draw={@draws[@toimen]}
      calls={@calls[@toimen]}
      :if={@toimen != nil}
      />
    <.live_component module={RiichiAdvancedWeb.PondComponent} id="pond toimen" pond={@ponds[@toimen]} :if={@toimen != nil} />
    <.live_component module={RiichiAdvancedWeb.HandComponent}
      id="hand kamicha"
      your_hand?={false}
      seat={@kamicha}
      hand={@hands[@kamicha]}
      draw={@draws[@kamicha]}
      calls={@calls[@kamicha]}
      :if={@kamicha != nil}
      />
    <.live_component module={RiichiAdvancedWeb.PondComponent} id="pond kamicha" pond={@ponds[@kamicha]} :if={@kamicha != nil} />
    <.live_component module={RiichiAdvancedWeb.CompassComponent} id="compass" seat={@seat} turn={@turn} riichi={@riichi} />
    <.live_component module={RiichiAdvancedWeb.WinWindowComponent} id="win-window" winner={@winner}/>
    <div class="buttons">
      <button class="button" phx-click="button_clicked" phx-value-name={name} :for={name <- @buttons[@seat]}><%= RiichiAdvanced.GlobalState.get_button_display_name(name) %></button>
    </div>
    <div class="call-buttons-container">
      <%= for {called_tile, choices} <- @call_buttons[@seat] do %>
        <%= if not Enum.empty?(choices) do %>
          <div class="call-buttons">
            <div class={["tile", called_tile]}></div>
            <div class="call-button-separator"></div>
            <%= for choice <- choices do %>
              <button class="call-button" phx-click="call_button_clicked" phx-value-name={@call_name[@seat]} phx-value-tile={called_tile} phx-value-choice={Enum.join(choice, ",")}>
              <%= for tile <- choice do %>
                <div class={["tile", tile]}></div>
              <% end %>
              </button>
            <% end %>
          </div>
        <% end %>
      <% end %>
    </div>
    <div class={["big-text", Utils.get_relative_seat(@seat, seat)]} :for={{seat, text} <- @big_text} :if={text != ""}><%= text %></div>
    <div class={["big-text"]} :if={@loading}>Loading...</div>
    """
  end

  def handle_event("button_clicked", %{"name" => name}, socket) do
    RiichiAdvanced.GlobalState.press_button(socket.assigns.seat, name)
    {:noreply, socket}
  end

  def handle_event("call_button_clicked", %{"tile" => called_tile, "name" => call_name, "choice" => choice}, socket) do
    call_choice = Enum.map(String.split(choice, ","), &Riichi.to_tile/1)
    RiichiAdvanced.GlobalState.run_actions([], %{seat: socket.assigns.seat, call_name: call_name, call_choice: call_choice, called_tile: Riichi.to_tile(called_tile)})
    {:noreply, socket}
  end

  def handle_info({:play_tile, tile, index}, socket) do
    if socket.assigns.seat == socket.assigns.turn do
      RiichiAdvanced.GlobalState.run_actions([["play_tile", tile, index], ["advance_turn"]], %{seat: socket.assigns.seat})
    end
    {:noreply, socket}
  end
  def handle_info({:reindex_hand, from, to}, socket) do
    RiichiAdvanced.GlobalState.reindex_hand(socket.assigns.seat, from, to)
    {:noreply, socket}
  end

  def handle_info(%{topic: "game:main", event: "played_tile", payload: %{"seat" => seat, "tile" => tile, "index" => index}}, socket) do
    relative_seat = Utils.get_relative_seat(socket.assigns.seat, seat)
    send_update(RiichiAdvancedWeb.HandComponent, id: "hand #{relative_seat}", played_tile: tile, played_tile_index: index)
    send_update(RiichiAdvancedWeb.PondComponent, id: "pond #{relative_seat}", played_tile: tile)
    {:noreply, socket}
  end

  def handle_info(%{topic: "game:main", event: "state_updated", payload: %{"state" => state}}, socket) do
    # animate new calls
    num_calls_before = Map.new(socket.assigns.calls, fn {seat, calls} -> {seat, length(calls)} end)
    num_calls_after = Map.new(state.players, fn {seat, player} -> {seat, length(player.calls)} end)
    Enum.each(Map.keys(num_calls_before), fn seat ->
      if num_calls_after[seat] > num_calls_before[seat] do
        relative_seat = Utils.get_relative_seat(socket.assigns.seat, seat)
        send_update(RiichiAdvancedWeb.HandComponent, id: "hand #{relative_seat}", num_new_calls: num_calls_after[seat] - num_calls_before[seat])
      end
    end)

    socket = assign(socket, :turn, state.turn)
    socket = assign(socket, :winner, state.winner)
    socket = assign(socket, :hands, Map.new(state.players, fn {seat, player} -> {seat, player.hand} end))
    socket = assign(socket, :ponds, Map.new(state.players, fn {seat, player} -> {seat, player.pond} end))
    socket = assign(socket, :calls, Map.new(state.players, fn {seat, player} -> {seat, player.calls} end))
    socket = assign(socket, :draws, Map.new(state.players, fn {seat, player} -> {seat, player.draw} end))
    socket = assign(socket, :buttons, Map.new(state.players, fn {seat, player} -> {seat, player.buttons} end))
    socket = assign(socket, :call_buttons, Map.new(state.players, fn {seat, player} -> {seat, player.call_buttons} end))
    socket = assign(socket, :call_name, Map.new(state.players, fn {seat, player} -> {seat, player.call_name} end))
    socket = assign(socket, :riichi, Map.new(state.players, fn {seat, player} -> {seat, player.riichi} end))
    socket = assign(socket, :big_text, Map.new(state.players, fn {seat, player} -> {seat, player.big_text} end))

    {:noreply, socket}
  end

  def handle_info(data, socket) do
    IO.puts("unhandled handle_info data:")
    IO.inspect(data)
    {:noreply, socket}
  end

end
