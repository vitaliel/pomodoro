defmodule Pomodoro.ProjectHelpers do
  use Phoenix.HTML
  alias Pomodoro.{Repo, Context}

  def select_context(form, field, opts \\ []) do
    contexts = Repo.all(Context.default)
    select(form, field, contexts |> Enum.map(&{&1.name, &1.id}),
      prompt: "Choose a context", class: "form-control")
  end
end
