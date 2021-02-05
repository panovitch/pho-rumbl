defmodule Rumbl.TestHelpers do
  alias Rumbl.{
    Accounts,
    Multimedia
  }

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "sss",
        username: "user#{System.unique_integer([:positive])}",
        password: "supersecret"
      })
      |> Accounts.register_user()
    user
  end

  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do
    attrs =
      Enum.into(attrs, %{
        title: "A title",
        url: "url",
        description: "A desctiption",
      })
    {:ok, vid } = Multimedia.create_video(user, attrs)

    vid
  end
end
