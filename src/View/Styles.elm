module Style exposing (style_tag)
import Html exposing (text, node)
import Html.Attributes exposing (class, type')

style_text = """
#elm-guitar .bar .tab-bar .string{
    margin: 0px;
    line-height: 0.5;
}
"""
style_tag =
    node "style" [type' "text/css"] [text style_text]
