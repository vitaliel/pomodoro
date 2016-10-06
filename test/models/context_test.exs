defmodule Pomodoro.ContextTest do
  use Pomodoro.ModelCase

  alias Pomodoro.Context

  @valid_attrs %{name: "some content", position: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Context.changeset(%Context{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Context.changeset(%Context{}, @invalid_attrs)
    refute changeset.valid?
  end
end
