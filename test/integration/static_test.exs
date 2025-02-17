defmodule Lexin.StaticTest do
  use ExUnit.Case, async: true
  use Wallaby.Feature

  import Wallaby.Query

  feature "opens about page", %{session: session} do
    session
    |> visit("/")
    |> click(link("About"))
    |> assert_has(
      css(".page_content",
        text:
          "We have built this little application to improve user experience, the functionality it provides is quite basic – pick a language and search for the word. That's simple!"
      )
    )
  end

  feature "opens contacts page", %{session: session} do
    session
    |> visit("/")
    |> click(link("Contacts"))
    |> assert_has(
      css(".page_content",
        text:
          "Lexin Mobi is an open-source project, and you can find its code on GitHub. You are welcome to join the development process. You can also use this link to submit feature requests or issues, or to contact authors of this app."
      )
    )
  end

  feature "opens installation page", %{session: session} do
    session
    |> visit("/")
    |> click(link("Install"))
    |> assert_has(
      css(".page_content",
        text:
          "You can use Lexin Mobi as a website in your browser. To share a word definition with a friend or colleague – copy and send the currently opened URL. (Psst... Save a bookmark for quick access to this website!)"
      )
    )
    |> assert_has(
      css(".page_content",
        text:
          "You can also install and run Lexin Mobi as mobile application. See our step-by-step instructions on how to install this application to your iPhone/iPad. For Android-based devices installation process is similar, but you need to use Chrome."
      )
    )
  end
end
