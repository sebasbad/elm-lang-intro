module Main_Forms exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model =
  { name : String
  , password : String
  , passwordAgain : String
  }

init : Model
init =
  Model "" "" ""

-- UPDATE

type Msg
  = Name String
  | Password String
  | PasswordAgain String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name name ->
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model
    ]

viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []

viewValidation : Model -> Html msg
viewValidation model =
  if model.password == model.passwordAgain && String.length model.password > 8 then
    div [ style "color" "green" ] [ text "OK" ]
  else if String.length model.password <= 8 then 
    div [ style "color" "red" ] [ text "Password must have at least 9 characters!" ] 
  else if String.toLower model.password == model.password || String.toUpper model.password == model.password then 
    div [ style "color" "red" ] [ text "Password should contain upper and lower case characters!" ]
  else if String.length (String.filter Char.isDigit model.password) == 0 then 
    div [ style "color" "red" ] [ text "Password should contain numeric characters!" ]
  else
    div [ style "color" "red" ] [ text "Passwords do not match!" ]
